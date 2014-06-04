class RenameTripIdToDayId < ActiveRecord::Migration
  def change
		remove_column :rankings, :trip_id
		add_reference :rankings, :day, index: true
  end
end
