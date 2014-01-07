# == Schema Information
#
# Table name: farms
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  location       :string(255)
#  address        :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip            :integer
#  county         :string(255)
#  country        :string(255)
#  owner          :string(255)
#  phone          :string(255)
#  certifications :string(255)
#  website        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Farm < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode

	def self.import(file)
		CSV.foreach(file.path, headers:true) do |row|		
			farm = find_by_id(row["id"]) || new
			farm.attributes = row.to_hash
			farm.save!
		end
	end
end
