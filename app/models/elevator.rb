class Elevator < ApplicationRecord
  belongs_to :Column
  has_many :Elevator

  def userid
    return self.Column.battery.building.customer.user.id
  end
end

