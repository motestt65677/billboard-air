class TimeslotsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.date :start_date
      t.date :end_date
      t.float :current_price
      t.timestamps
    end

    remove_column :bids, :board_id
    add_reference :bids, :timeslot, index: true, foreign_key: true

  end
end
