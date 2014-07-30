class SessionsController < ApplicationController
	def create
		auth = env['omniauth.auth']
		session[:token] = get_token(auth)
		redirect_to '/'
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
