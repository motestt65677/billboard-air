class Board < ApplicationRecord
  belongs_to :user
  has_many :timeslots, dependent: :destroy
  validates :title, presence: true
  validates :current_price, presence: true
  validates :location, presence: true
  include PgSearch
  pg_search_scope :search_by_title_and_description, :against => [:title, :description, :location], :using => {:tsearch => {:prefix => true}}
  mount_uploaders :images, BoardUploader
  
  geocoded_by :location   
  after_validation :geocode  



end
