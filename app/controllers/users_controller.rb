class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find_by_id(params[:id])
  end
  def create
    user = User.new(user_params)
    if params[:password] == params[:password_confirmation]
      user.password=(params[:password])
    end
    
    if user.save
      flash[:success] = "user created"
      redirect_to sign_in_path
    else
      flash[:alert] = "something went wrong"
      redirect_to "/"
    end

  end


  


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
