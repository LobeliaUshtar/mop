class Characterization < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :category
end
