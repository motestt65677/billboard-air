class Timeslot < ApplicationRecord
  belongs_to :board
  has_many :bids, dependent: :destroy

end
