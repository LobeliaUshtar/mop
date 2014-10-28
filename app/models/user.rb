class User < ActiveRecord::Base
  before_validation :generate_slug
  
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :phone, presence: true
  validates :slug, uniqueness: true

  scope :admin_yes, -> { where(:admin => true) }
  scope :admin_no, -> { where(:admin => false) }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end