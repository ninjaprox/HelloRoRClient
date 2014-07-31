class StaticPagesController < ApplicationController
	def home
		
	end

	def products
		api = RestClient::Resource.new('http://localhost:3001/api')

		api['products'].get do |response, request, result, &block|
			@products = JSON.parse(response)
		end
	end
end
