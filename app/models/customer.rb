class Customer < ApplicationRecord
  belongs_to :users
  belongs_to :address
end
