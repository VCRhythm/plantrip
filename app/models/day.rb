# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Day < ActiveRecord::Base
	belongs_to :trip
	has_many :rankings, -> { order("position DESC")}
	has_many :markets, through: :rankings
end
