class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration[5.1]
  def change
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
