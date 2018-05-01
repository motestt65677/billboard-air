class BidsController < ApplicationController
  before_action :check_sign_in
  before_action :find_timeslot_and_board

  def create
    timeslot = Timeslot.find(params[:id])
    board = timeslot.board
    new_bid_price = params[:price]

    if timeslot.check_bid_price(new_bid_price)
      timeslot.update_bid_price(new_bid_price)
      bid = timeslot.bids.create(
              price: new_bid_price,
              user_id: current_user.id 
            )
      ActionCable.server.broadcast "room_channel_#{params[:id]}",
        price: bid.price, bid_count: timeslot.bids.count
    else
      flash[:notice] = "your price is lower than current bid price"
      redirect_to board_timeslot_path(board, timeslot)
    end
  end

  private

  def check_sign_in
    if !signed_in?
      flash[:notice] = "Please sign in to join the auction"
      redirect_to sign_in_path
    end
  end

  def find_timeslot_and_board
    timeslot = Timeslot.find(params[:id])
    board = timeslot.board
  end


end
