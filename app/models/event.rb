class Event < ActiveRecord::Base
  def self.ended
     where("date_end < ?", Time.now).order("date_start asc")
   end

   def self.current_upcoming
     where("date_start > ?", Time.now).order("date_start asc")
   end
end