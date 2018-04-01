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
    boards = Board.search_by_title_and_description(params[:search_result])
    @timeslots = []
    boards.each do |board|
      board.timeslots.each do |timeslot|
        @timeslots << timeslot
      end
    end
    if params[:search_result] == ""
      @timeslots = Timeslot.all
    end
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_date, :end_date, :current_price)
  end

end
