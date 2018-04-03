class Timeslot < ApplicationRecord
  belongs_to :board
  has_many :bids, dependent: :destroy
  def auction_span
    (self.end_date - self.start_date).to_i
  end
end
