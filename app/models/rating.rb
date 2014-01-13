# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  market_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  score      :integer
#

class Rating < ActiveRecord::Base
	before_save :default_values

	belongs_to :user
	belongs_to :market

	def default_values
		self.score ||= 0
	end
end
