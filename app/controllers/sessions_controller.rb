class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.is_password?(params[:password])
      session[:user_id] = user.id
      flash[:success] = "welcome back!"
      redirect_to "/"
    else
      flash[:notice] = "wrong email or password"
      redirect_to sign_in_path
    end
  end

  def destroy
    reset_session
    redirect_to sign_in_path
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = billboards_path
      @notice = "Signed in!"
    # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = edit_user_path(user)
      @notice = "User created. Please confirm or edit details"
    end

    sign_in(user)
    redirect_to @next, :notice => @notice
  end

  
end
