class Event < ActiveRecord::Base
  validates_presence_of :title, :date_start, :date_end, :details

  def self.ended
     where("date_end < ?", Time.now).order("date_start asc")
   end

   def self.current_upcoming
     where("date_start > ?", Time.now).order("date_start asc")
   end
end