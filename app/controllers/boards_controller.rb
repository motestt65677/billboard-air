class BoardsController < ApplicationController
  before_action :require_login
  before_action :find_board, only:[:show, :edit, :update, :destroy]


  def index
    @boards = Board.where(user_id: params[:user_id]).includes(:user)
  end

  def new
  end

  def create
    board = current_user.boards.new(board_params)
    board.format_location(params[:board][:location])
    if board.save
      flash[:success] = "billboard successfully created"
      redirect_to user_board_path(board.user, board)
    else
      flash[:notice] = "something went wrong"
      redirect_to new_user_board_path(current_user)
    end
  end

  def show
  end

  def edit
    @user = @board.user
  end
  
  def update
    board.update_attributes(board_params)

    if board.save
      flash[:success] = "billboard successfully updated"
      redirect_to user_board_path(board.user, board)
    else
      flash[:notice] = "something went wrong"
      redirect_to edit_board_path(board)
    end    
  end

  def destroy
    user = board.user
    if board.destroy
      flash[:notice] = "billboard successfully deleted"
      redirect_to user_boards_path(user)
    else
      flash[:notice] = "something went wrong"
      redirect_to user_boards_path(user)
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
    params.require(:board).permit(:title, :description, :location, {images:[]})
  end

  def find_board
    @board = Board.find(params[:id])
  end

end

