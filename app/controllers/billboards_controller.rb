class BillboardsController < ApplicationController
  def index
    @timeslots = Timeslot.all.includes(:board => :user)
    @user = current_user
    @boards = Timeslot.boards(@timeslots)
    @average_lat = Board.average_lat(@boards)
    @average_long = Board.average_long(@boards)


  end
end

