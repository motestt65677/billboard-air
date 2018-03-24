class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.float :current_price
      t.string :description
      t.string :location
      t.json :images
      t.timestamps
    end

    create_table :bids do |t|
      t.float :price
      t.timestamps
    end

    create_table :reviews do |t|
      t.string :text
      t.timestamps
    end

    add_reference :boards, :user, foreign_key: true, index: true
    add_reference :bids, :user, foreign_key: true, index: true
    add_reference :bids, :board, foreign_key: true, index: true
    add_reference :reviews, :board, foreign_key: true, index: true
    add_reference :reviews, :user, foreign_key: true, index: true
  end
end
