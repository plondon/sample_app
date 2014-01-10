module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token # create a new token
		cookies.permanent[:remember_token] = remember_token # place encrypted token in browsers cookie
		user.update_attribute(:remember_token, User.encrypt(remember_token)) # save encrypted token to database
		self.current_user = user # set current user equal to user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
end
