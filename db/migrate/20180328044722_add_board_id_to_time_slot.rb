class AddBoardIdToTimeSlot < ActiveRecord::Migration[5.1]
  def change
    add_reference :timeslots, :board, index: true, foreign_key: true
  end
end
