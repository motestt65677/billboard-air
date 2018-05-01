class Timeslot < ApplicationRecord
  belongs_to :board
  has_many :bids, dependent: :destroy
  before_save :calculate_auction_end_date
  before_save :auction_status
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
  def calculate_days_left
    (self.auction_end - Date.today).to_i
  end
  def auction_status
    if self.auction_start > Date.today
      self.status = "pending"
    elsif self.auction_end < Date.today
      self.status = "end"
    else 
      self.status = "live"
    end
  end

  def check_bid_price(new_price)
    if new_price.to_f <= self.current_price.to_f
      return false
    else
      return true
    end
  end


  def update_bid_price(new_price)
    self.current_price = new_price
    self.save
  end

end
