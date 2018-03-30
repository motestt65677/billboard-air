class Board < ApplicationRecord
  belongs_to :user
  has_many :timeslots, dependent: :destroy
  has_many :bids, dependent: :destroy
  validates :title, presence: true
  validates :current_price, presence: true
  validates :location, presence: true
  include PgSearch
  pg_search_scope :search_by_title_and_description, :against => [:title, :description]
  mount_uploaders :images, BoardUploader
end
