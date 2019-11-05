class Event < ApplicationRecord
  validates :start_date, presence: true
  def start_date_cannot_be_in_the_past
    if !start_date.blank? and expiration_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
  validate :duration_must_be_multiple_of_5
  private
  def duration_must_be_multiple_of_5
    return if duration.blank? #On sort de la fonction si duration est vide
    if duration % 5 != 0
      errors.add(:duration, "Duration has to be multiple of 5")
    end
  end
	validates :duration, :numericality => {:greater_than => 0}, presence: true
	validates :title, presence: true, length: { in: 5...140}
	validates :description, presence: true, length: { in: 20...1000}
	validates :price, presence: true, length: { in: 1...1000}			
	validates :location, presence: true			
	has_many :attendance
  has_many :users, through: :attendance
end
