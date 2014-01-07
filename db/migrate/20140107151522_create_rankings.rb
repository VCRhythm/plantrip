class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
			t.belongs_to :trip
			t.belongs_to :market
      t.integer :rank

      t.timestamps
    end
  end
end
