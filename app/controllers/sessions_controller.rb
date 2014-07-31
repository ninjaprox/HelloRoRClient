class SessionsController < ApplicationController
	def create
		api = RestClient::Resource.new('http://localhost:3001/api')
		auth = env['omniauth.auth']

		session[:token] = get_token(auth)
		api['users'].post name: get_name(auth), link: get_link(auth), :content_type => 'text/json'

		redirect_to products_path
	end

	def destroy
		session[:token] = nil
		redirect_to '/'
	end

	private
		def get_token(auth)
			auth['credentials']['token']
		end

		def get_name(auth)
			auth[:extra][:raw_info][:name]
		end

		def get_link(auth)
			auth[:extra][:raw_info][:link]
		end
end
