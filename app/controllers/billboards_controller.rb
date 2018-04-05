class BillboardsController < ApplicationController
  def index
    @timeslots = Timeslot.all.includes(:board => :user).order("
      CASE
        WHEN status = 'live' THEN '1'
        WHEN status = 'pending' THEN '2'
        WHEN status = 'end' THEN '3'
      END"
    )
    @user = current_user
    @boards = Timeslot.boards(@timeslots)
    @average_lat = Board.average_lat(@boards)
    @average_long = Board.average_long(@boards)


  end
end

