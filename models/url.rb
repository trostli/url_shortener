class URL < ActiveRecord::Base
	validates :url, presence: true
end
