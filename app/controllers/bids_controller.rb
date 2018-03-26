class BidsController < ApplicationController
  def create
    board = Board.find(params[:id])
    bid = board.bids.new(price: params[:price])
    bid.user_id = current_user.id
    if bid.price.to_f > board.current_price.to_f
      board.current_price = bid.price
      board.save
      if bid.save
        ActionCable.server.broadcast "room_channel_#{params[:id]}",
          price:  bid.price
      end
    else
      flash[:notice] = "your price is lower than current bid price"
      redirect_to board_path(board)
    end
  end
end
