class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :correct_user!, only: [:index]

  def new
    @attendance = Attendance.new
  end

  def create
    if @event.is_free?
      @attendance = Attendance.new(
        user: current_user,
        event: @event
      )
    else
      customer = Stripe::Customer.create(
        email: current_user.email,
        source: params[:stripeToken]
      )

      Stripe::Charge.create(
        customer: customer.id,
        amount: @event.price * 100,
        currency: "eur",
        description: "Paiement pour #{@event.title}"
      )

      @attendance = Attendance.new(
        user: current_user,
        event: @event,
        stripe_customer_id: customer.id
      )
    end

    if @attendance.save
      redirect_to event_path(@event), notice: "Vous avez bien rejoint l'événement !"
    else
      render :new, status: :unprocessable_entity
    end

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    render :new, status: :unprocessable_entity
  end

  def index
    @attendances = @event.attendances.includes(:user)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def correct_user!
    unless current_user == @event.user
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end
end