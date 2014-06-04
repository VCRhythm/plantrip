class RenameTripToDay < ActiveRecord::Migration
  def change
		rename_table :trips, :days
  end
end
