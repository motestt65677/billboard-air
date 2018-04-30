module SessionsHelper
  
  def signed_in?
    if User.find_by_id(session[:user_id])
      true
    else
      false
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    user = User.find_by_id(session[:user_id])
  end
end
