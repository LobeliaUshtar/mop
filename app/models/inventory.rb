class Inventory < ActiveRecord::Base
  before_validation :generate_slug

  validates :name, presence: true

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  scope :low, -> { where(:running_low => true).order(name: :asc) }

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end