class Event < ActiveRecord::Base
  validates :title, :date_start, :date_end, :details, presence: true
  validates :details, length: { minimum: 25 }

  scope :ended, -> {  where("date_end < ?", Time.now).order(date_end: :asc) }
  # def self.ended
  #    where("date_end < ?", Time.now).order("date_start asc")
  #  end

  scope :upcoming, -> {  where("date_start > ?", Time.now).order(date_start: :asc) }
   # def self.upcoming
   #   where("date_start > ?", Time.now).order("date_start asc")
   # end
end