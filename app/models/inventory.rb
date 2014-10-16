class Inventory < ActiveRecord::Base
  has_many :characterizations, dependent: :destroy
  has_many :categories, through: :characterizations

  validates :name, :count, :shop, presence: true

  SHOPS = [1, 2, 3, 4, 5, 6, 7, 8]

  validates :shop, inclusion: { 
    in: SHOPS,
    message: "must be between 1 and 8"
  }

  scope :low, -> { where('count <= 10').order(count: :desc) }
  # def self.low
  #   where('count <= 10').order(count: :desc)
  # end
  
end