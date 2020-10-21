class Customer < ApplicationRecord
  belongs_to :users
  belongs_to :address
  has_one :building
end
