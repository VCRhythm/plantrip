class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :location
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :county
      t.string :country
      t.string :owner
      t.string :phone
      t.string :certifications
      t.string :website

      t.timestamps
    end
  end
end
