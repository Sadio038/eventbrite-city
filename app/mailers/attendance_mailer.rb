class AttendanceMailer < ApplicationMailer
  def notify_creator(attendance)
    @attendance = attendance
    @event = attendance.event
    @participant = attendance.user
    @creator = @event.user
    mail(
      to: @creator.email,
      subject: "Quelqu'un a rejoint ton événement !"
    )
  end
end
