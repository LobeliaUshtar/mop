class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :phone, presence: true

  scope :admin_yes, -> { where(:admin => true) }
  scope :admin_no, -> { where(:admin => false) }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end