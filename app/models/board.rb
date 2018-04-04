class Board < ApplicationRecord
  belongs_to :user
  has_many :timeslots, dependent: :destroy
  validates :title, presence: true
  validates :location, presence: true
  include PgSearch
  pg_search_scope :search_by_title_and_description, :against => [:title, :description, :location], :using => {:tsearch => {:prefix => true}}
  mount_uploaders :images, BoardUploader
  
  geocoded_by :location   
  after_validation :geocode  

  def self.average_lat(boards)
    total_lat = 0
    boards.each do |board|
      total_lat = total_lat + board.latitude
    end
    total_lat/boards.count
  end

  def self.average_long(boards)
    total_long = 0
    boards.each do |board|
      total_long = total_long + board.longitude
    end
    total_long/boards.count
  end

  def format_location(address)
    self.location = "#{address[:street_address]}, #{address[:district]}, #{address[:city]}, #{address[:country]}"
  end

    

end
