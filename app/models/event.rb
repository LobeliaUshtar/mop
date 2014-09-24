class Event < ActiveRecord::Base
  validates :title, :date_start, :date_end, :details, presence: true
  validates :details, length: { minimum: 25 }

  def self.ended
     where("date_end < ?", Time.now).order("date_start asc")
   end

   def self.current_upcoming
     where("date_start > ?", Time.now).order("date_start asc")
   end
end