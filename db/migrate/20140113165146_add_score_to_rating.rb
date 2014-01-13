class AddScoreToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :score, :integer
		remove_column :ratings, :value
  end
end
