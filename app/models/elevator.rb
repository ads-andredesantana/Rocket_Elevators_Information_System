class Elevator < ApplicationRecord
  belongs_to :column

  def userid
    return self.Column.battery.building.customer.user.id
  end
end
end
