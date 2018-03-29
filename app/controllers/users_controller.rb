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
      session[:user_id] = user.id
      redirect_to "/boards"
    else
      flash[:alert] = "something went wrong"
      redirect_to sign_up_path
    end

  end

  def update
    user = User.find_by_id(params[:id])
    user.update_attributes(user_params)
    user.save
    redirect_to "/boards"
  end

  


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
