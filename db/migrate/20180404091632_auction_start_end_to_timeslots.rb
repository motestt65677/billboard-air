class AuctionStartEndToTimeslots < ActiveRecord::Migration[5.1]
  def change
    add_column :timeslots, :auction_start, :date
    add_column :timeslots, :auction_end, :date
  end
end
