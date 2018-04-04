class AddStatusToTimeslots < ActiveRecord::Migration[5.1]
  def change
    add_column :timeslots, :status, :string
  end
end
