class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :notify_event_creator

  private

  def notify_event_creator
    AttendanceMailer.notify_creator(self).deliver_now
  end
end