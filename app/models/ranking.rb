# == Schema Information
#
# Table name: rankings
#
#  id         :integer          not null, primary key
#  rank       :integer
#  trip_id    :integer
#  market_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ranking < ActiveRecord::Base
	belongs_to :trip
	belongs_to :market
	acts_as_list scope: :trip
end
