class Event < ActiveRecord::Base
	has_one :location
	validates :name,  presence:true
end
