class BidsController < ApplicationController
  def create
    timeslot = Timeslot.find(params[:id])
    board = timeslot.board
    bid = timeslot.bids.new(price: params[:price])
    bid.user_id = current_user.id
    if bid.price.to_f > timeslot.current_price.to_f
      timeslot.current_price = bid.price
      timeslot.save
      if bid.save
        ActionCable.server.broadcast "room_channel_#{params[:id]}",
          price:  bid.price
      end
    else
      flash[:notice] = "your price is lower than current bid price"
      redirect_to board_timeslot_path(board, timeslot)
    end
  end
end
