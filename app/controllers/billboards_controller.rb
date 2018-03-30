class BillboardsController < ApplicationController
  def index
    @timeslots = Timeslot.all.includes(:board => :user)
  end
end
