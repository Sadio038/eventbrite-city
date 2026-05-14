class Admin::EventSubmissionsController < Admin::BaseController
  def index
    @pending_events = Event.where(validated: nil)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if params[:approved]
      @event.update(validated: true)
      EventMailer.event_approved(@event).deliver_now
      redirect_to admin_event_submissions_path, notice: "Événement validé !"
    elsif params[:rejected]
      @event.update(validated: false)
      EventMailer.event_rejected(@event).deliver_now
      redirect_to admin_event_submissions_path, notice: "Événement refusé !"
    end
  end
end
