class BillboardsController < ApplicationController
  def index
    @timeslots = Timeslot.all.includes(:board => :user)
    @user = current_user
  end
end
