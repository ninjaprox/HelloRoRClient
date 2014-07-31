class StaticPagesController < ApplicationController
	before_action :logged_in, only: [:products]

	def home
		
	end

	def products
		api = RestClient::Resource.new(ENV['API_ENDPOINT'])

		api['products'].get do |response, request, result, &block|
			@products = JSON.parse(response)
		end
	end

	private
		def logged_in
			unless logged_in?
				redirect_to root_path
			end
		end
end
