class Donator < ActiveRecord::Base
  before_validation :generate_slug
  
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  scope :current_donator, -> { where(:current => true) }
  scope :former_donator, -> { where(:current => false) }

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end