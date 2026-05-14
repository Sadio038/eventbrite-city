class EventMailer < ApplicationMailer
  def event_approved(event)
    @event = event
    @user = event.user
    mail(
      to: @user.email,
      subject: "🎉 Votre événement a été validé !"
    )
  end

  def event_rejected(event)
    @event = event
    @user = event.user
    mail(
      to: @user.email,
      subject: "❌ Votre événement n'a pas été validé"
    )
  end
end
