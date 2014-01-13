class CreateTripsUsers < ActiveRecord::Migration
  def change
    create_table :trips_users do |t|
			t.belongs_to :user
			t.belongs_to :trip
    end
  end
end
