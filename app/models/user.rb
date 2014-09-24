class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :phone, presence: true
end