class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
			t.integer :value
			t.belongs_to :user
			t.belongs_to :market

      t.timestamps
    end
  end
end
