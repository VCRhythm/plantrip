# == Schema Information
#
# Table name: rankings
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  market_id  :integer
#  rank       :integer
#  created_at :datetime
#  updated_at :datetime
#  position   :integer
#

class Ranking < ActiveRecord::Base
	belongs_to :day
	belongs_to :market
	acts_as_list scope: :day
	
	validates_uniqueness_of :market_id, scope: :day_id
end
