# Preview all emails at http://localhost:3000/rails/mailers/attendance_mailer
class AttendanceMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/attendance_mailer/notify_creator
  def notify_creator
    AttendanceMailer.notify_creator
  end
end
