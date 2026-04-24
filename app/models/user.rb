class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :events, dependent: :destroy  # les événements qu'il administre

  # Les événements auxquels il participe (via les attendances)
  has_many :attended_events, through: :attendances, source: :event
end