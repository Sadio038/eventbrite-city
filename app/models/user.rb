class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event
  has_one_attached :avatar

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end

def is_admin?
  is_admin == true
end