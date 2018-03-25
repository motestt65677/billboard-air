class Board < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_title_and_description, :against => [:title, :description]
end
