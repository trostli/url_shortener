class URL < ActiveRecord::Base
	validates :url, presence: true 
	validate :include_http_or_https?

	def include_http_or_https?
		unless self.url.start_with?('http://', 'https://')
			errors.add(:url, "has to include http:// or https://")
		end
	end
end
