class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :website
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :location
      t.boolean :credit
      t.boolean :cheese
			t.boolean :bakedgoods
      t.boolean :maple
      t.boolean :meat
      t.boolean :nursery
      t.boolean :nuts
      t.boolean :plants
      t.boolean :poultry
      t.boolean :prepared
      t.boolean :soap
      t.boolean :trees
      t.boolean :wine
      t.datetime :updatetime

      t.timestamps
    end
  end
end
