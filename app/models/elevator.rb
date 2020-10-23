class Elevator < ApplicationRecord
  belongs_to :column
  has_many :elevator

  def userid
    return self.Column.battery.building.customer.user.id
  end
end

