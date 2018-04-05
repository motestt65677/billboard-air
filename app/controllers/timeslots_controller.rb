class TimeslotsController < ApplicationController
  def index
    @timeslots = []
    @user = User.includes(:boards => :timeslots).find(params[:user_id])
    @user.boards.each do |board|
      board.timeslots.each do |timeslot|
        @timeslots << timeslot
      end
    end
  end
  def new
    @board = Board.find(params[:board_id])
    @timeslot = Timeslot.new
  end

  def create
    board = Board.find(params[:board_id])
    timeslot = board.timeslots.new(timeslot_params)

    if timeslot.save
      flash[:success] = "timeslot successfully created"
      redirect_to board_timeslot_path(board, timeslot)
    else
      flash[:alert] = "something went wrong"
      redirect_to new_board_timeslot_path(board, Timeslot.new)
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @timeslot = Timeslot.find(params[:id])
  end

  def search
    @user = current_user

    if params[:search_result] == ""
      @boards = @user.boards
    else
      @boards = @user.boards.search_by_title_and_description(params[:search_result])
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

  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_date, :end_date, :current_price, :auction_start)


  end

end
