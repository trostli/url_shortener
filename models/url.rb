class URL < ActiveRecord::Base
	validates :url, presence: true
	validate :include_http_or_https?

	def include_http_or_https?
		unless self.url.start_with?('http://', 'https://')
			errors.add(:url, "has to include http:// or https://")
		end
	end

  def increment!
    count = self.click_count || 0 # avoid this by adding default value to your click_count column.
    self.update_attribute :click_count, count+1
  end
end
