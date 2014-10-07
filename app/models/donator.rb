class Donator < ActiveRecord::Base
  def self.current_donator
    where("current == true")
  end
end