class RenameBatteryType < ActiveRecord::Migration[5.2]
  def change
    change_table :batteries do |t|
      t.rename :type, :battery_type
    end

    change_table :columns do |t|
      t.rename :type, :column_type
    end
    change_table :elevators do |t|
      t.rename :type, :elevator_type
    end
  end 
end


