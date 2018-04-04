class Timeslot < ApplicationRecord
  belongs_to :board
  has_many :bids, dependent: :destroy
  def auction_span
    (self.end_date - self.start_date).to_i
  end
  def self.boards(timeslots)
    boards = []
    timeslots.each do |timeslot|
      boards << timeslot.board
    end
    boards
  end
end
