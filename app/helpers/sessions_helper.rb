module SessionsHelper
	def sign_in(user)
<<<<<<< HEAD
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
=======
		remember_token = User.new_remember_token # create a new token
		cookies.permanent[:remember_token] = remember_token # place encrypted token in browsers cookie
		user.update_attribute(:remember_token, User.encrypt(remember_token)) # save encrypted token to database
		self.current_user = user # set current user equal to user
>>>>>>> b2851ed12371322d1fd36f6e1dc5c6bf0c087703
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
<<<<<<< HEAD
	
	def current_user?(user)
    	user == current_user
  	end

	def sign_out
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end
=======
>>>>>>> b2851ed12371322d1fd36f6e1dc5c6bf0c087703
end
