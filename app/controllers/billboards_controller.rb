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

  def search
    @user = current_user


    if params[:search_result] == ""
      @boards = Board.all
    else
      @boards = Board.search_by_title_and_description(params[:search_result])
    end
    
    @timeslots = []
    @boards.each do |board|
      board.timeslots.each do |timeslot|
        @timeslots << timeslot
      end
    end
    @timeslots = Timeslot.where(id: @timeslots.map(&:id)).order("
      CASE
        WHEN status = 'live' THEN '1'
        WHEN status = 'pending' THEN '2'
        WHEN status = 'end' THEN '3'
      END"
    )

    @average_lat = Board.average_lat(@boards)
    @average_long = Board.average_long(@boards)
  end

end

