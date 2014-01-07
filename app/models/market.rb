# == Schema Information
#
# Table name: markets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  website     :string(255)
#  street      :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :string(255)
#  latitude    :float
#  longitude   :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Market < ActiveRecord::Base
	
	geocoded_by :full_address
	after_validation :geocode
	
	has_many :rankings
	has_many :trips, through: :ranking

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
