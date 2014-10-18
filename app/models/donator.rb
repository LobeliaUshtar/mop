class Donator < ActiveRecord::Base
  validates :name, presence: true

  scope :current_donator, -> { where(:current => true) }
  scope :former_donator, -> { where(:current => false) }
end