class Donator < ActiveRecord::Base
  validates :name, presence: true

  def self.current_donator
    where("current == true")
  end
end