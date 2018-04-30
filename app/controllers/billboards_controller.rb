class BillboardsController < ApplicationController
  before_action :find_current_user, only: [:index, :search]

  def index
    @timeslots = Timeslot.all.includes(:board => :user).order("
      CASE
        WHEN status = 'live' THEN '1'
        WHEN status = 'pending' THEN '2'
        WHEN status = 'end' THEN '3'
      END"
    )
    @boards = Timeslot.boards(@timeslots)
    @average_lat = Board.average_lat(@boards)
    @average_long = Board.average_long(@boards)
  end

  def search
    @boards = if params[:search_result] == ""
                Board.all
              else
                Board.search_by_title_and_description(params[:search_result])
              end

    @timeslots = Board.find_timeslot_array(@boards)

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

  private

    def find_current_user
      @user = current_user
    end
end

