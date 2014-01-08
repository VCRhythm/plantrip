class AddRatingToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :rating, :float
  end
end
