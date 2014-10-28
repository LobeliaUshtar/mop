class Inventory < ActiveRecord::Base
  before_validation :generate_slug
  
  has_many :characterizations, dependent: :destroy
  has_many :categories, through: :characterizations

  validates :name, :count, :shop, presence: true

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  SHOPS = [1, 2, 3, 4, 5, 6, 7, 8]

  validates :shop, inclusion: { 
    in: SHOPS,
    message: "must be between 1 and 8"
  }

  scope :low, -> { where('count <= 10').order(count: :asc) }

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end