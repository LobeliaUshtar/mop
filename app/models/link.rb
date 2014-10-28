class Link < ActiveRecord::Base
  before_validation :generate_slug
  
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end