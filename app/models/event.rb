class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :start_date, presence: true

  # Valide que la duration est un multiple de 5
  validate :duration_must_be_multiple_of_five

  # Valide que la date n'est pas dans le passé
  validate :start_date_cannot_be_in_the_past

  private

  def duration_must_be_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end
end
