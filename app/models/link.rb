class Link < ActiveRecord::Base
  validates :name, presence: true
end