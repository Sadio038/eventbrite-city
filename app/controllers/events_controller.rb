class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :correct_user!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event), notice: "Événement créé avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Événement modifié avec succès !"
    else
      @event = Event.find(params[:id])
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: "Événement supprimé avec succès !"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def correct_user!
    unless current_user == @event.user
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location, :cover)
  end
end