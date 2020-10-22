class Employee < ApplicationRecord
  has_one :user
  has_one :battery
end
