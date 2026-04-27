class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end