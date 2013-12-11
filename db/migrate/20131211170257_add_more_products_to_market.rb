class AddMoreProductsToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :crafts, :boolean
    add_column :markets, :flowers, :boolean
    add_column :markets, :eggs, :boolean
    add_column :markets, :seafood, :boolean
    add_column :markets, :herbs, :string
    add_column :markets, :boolean, :string
    add_column :markets, :fruitsandvegetables, :boolean
    add_column :markets, :honey, :boolean
    add_column :markets, :jams, :boolean
  end
end
