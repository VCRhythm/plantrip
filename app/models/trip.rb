class Trip < ActiveRecord::Base
	has_many :days
	has_and_belongs_to_many :users
end
