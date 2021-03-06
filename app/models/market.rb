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
#  rating      :float
#

class Market < ActiveRecord::Base
	
	geocoded_by :full_address
	after_validation :geocode
	
	validates :name, presence: true

	has_many :rankings
	has_many :trips, through: :ranking
	has_many :ratings

	after_initialize :init

	def init
		self.rating ||= 0.0
	end
		
	def full_address
		"#{street}, #{city}, #{state} #{zip}"
	end

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |market|
				csv << market.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers:true) do |row|		
			market = find_by_id(row["id"]) || new
			market.attributes = row.to_hash
			market.save!
		end
	end
end
