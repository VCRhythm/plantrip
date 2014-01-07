# == Schema Information
#
# Table name: markets
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  website             :string(255)
#  street              :string(255)
#  city                :string(255)
#  state               :string(255)
#  zip                 :string(255)
#  latitude            :float
#  longitude           :float
#  location            :string(255)
#  credit              :boolean
#  cheese              :boolean
#  bakedgoods          :boolean
#  maple               :boolean
#  meat                :boolean
#  nursery             :boolean
#  nuts                :boolean
#  plants              :boolean
#  poultry             :boolean
#  prepared            :boolean
#  soap                :boolean
#  trees               :boolean
#  wine                :boolean
#  updatetime          :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  crafts              :boolean
#  flowers             :boolean
#  eggs                :boolean
#  seafood             :boolean
#  herbs               :string(255)
#  boolean             :string(255)
#  fruitsandvegetables :boolean
#  honey               :boolean
#  jams                :boolean
#

class Market < ActiveRecord::Base
	
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode

	def full_address
		"#{street}, #{city}, #{state} #{zip}"
	end

	def self.import(file)
		CSV.foreach(file.path, headers:true) do |row|		
			market = find_by_id(row["id"]) || new
			market.attributes = row.to_hash
			market.save!
		end
	end
end
