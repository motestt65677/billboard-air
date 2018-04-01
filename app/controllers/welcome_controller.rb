class WelcomeController < ApplicationController
  def index
  	if current_user
      redirect_to billboards_path
  	end
  end
end
        