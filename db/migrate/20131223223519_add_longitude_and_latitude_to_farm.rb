class AddLongitudeAndLatitudeToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :longitude, :float
    add_column :farms, :latitude, :float
  end
end
