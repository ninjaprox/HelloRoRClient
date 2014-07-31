class StaticPagesController < ApplicationController
	def home
		
	end

	def products
		api = RestClient::Resource.new(ENV['API_ENDPOINT'])

		api['products'].get do |response, request, result, &block|
			@products = JSON.parse(response)
		end
	end
end
