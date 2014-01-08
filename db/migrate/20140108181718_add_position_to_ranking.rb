class AddPositionToRanking < ActiveRecord::Migration
  def change
    add_column :rankings, :position, :integer
  end
end
