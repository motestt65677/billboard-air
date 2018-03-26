class BoardsController < ApplicationController
  before_action :require_login

  def index
    @boards = Board.order(:created_at)

  end

  def new
    @board = Board.new()
  end

  def create
    byebug
    board = current_user.boards.new(board_params)
    board.current_price = params[:board][:current_price].to_f
    if board.save
      flash[:success] = "billboard successfully created"
      redirect_to board_path(board)
    else
      flash[:notice] = "something went wrong"
      redirect_to new_board_path
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end
  
  def update
    board = Board.find(params[:id])
    board.update_attributes(board_params)
    if board.save
      flash[:success] = "billboard successfully updated"
      redirect_to board_path(board)
    else
      flash[:notice] = "something went wrong"
      redirect_to edit_board_path(board)
    end    
  end

  def destroy
    board = Board.find(params[:id])
    if board.destroy
      flash[:notice] = "billboard successfully deleted"
      redirect_to boards_path
    else
      flash[:notice] = "something went wrong"
      redirect_to boards_path
    end 
  end

  def search
    @boards = Board.search_by_title_and_description(params[:search_result])
    if params[:search_result] == ""
      @boards = Board.all
    end
  end

  private
  def require_login
    user = User.find_by_id(session[:user_id])
    if !user
      flash[:error] = "You must be logged in to access this section"
      redirect_to sign_in_path
    end
  end

  def board_params
    params.require(:board).permit(:title, :description, :location, :current_price, {images:[]})
  end
end
