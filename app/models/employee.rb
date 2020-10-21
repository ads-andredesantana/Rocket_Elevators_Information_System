class Employee < ApplicationRecord
  belongs_to :users
  has_one :battery
end
