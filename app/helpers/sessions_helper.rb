module SessionsHelper
	def logged_in?
		!session[:token].nil?
	end
end
