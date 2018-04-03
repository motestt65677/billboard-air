class BillboardsController < ApplicationController
  def index
    @timeslots = Timeslot.all.includes(:board => :user)
    @user = current_user
    @locations = []
    @timeslots.each do |timeslot|
      @locations << [timeslot.board.latitude, timeslot.board.longitude, timeslot.board.location]
    end


    total_lat = 0
    total_long = 0
    @locations.each do |location|
      total_lat = total_lat + location[0]
      total_long = total_long + location[1]
    end

    @average_lat = total_lat / @locations.count
    @average_long = total_long / @locations.count
    
  end
end
