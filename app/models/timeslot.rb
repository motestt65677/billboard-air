class Timeslot < ApplicationRecord
  belongs_to :board
  has_many :bids, dependent: :destroy
  before_save :calculate_auction_end_date
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

  def calculate_auction_end_date
    self.auction_end = self.auction_start + 7
  end
end
