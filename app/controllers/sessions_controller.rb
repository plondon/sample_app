class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
<<<<<<< HEAD
  		redirect_back_or user
=======
  		redirect_to user
>>>>>>> b2851ed12371322d1fd36f6e1dc5c6bf0c087703
  	else
  		flash.now[:error] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
<<<<<<< HEAD
  	sign_out
  	redirect_to root_url
=======
>>>>>>> b2851ed12371322d1fd36f6e1dc5c6bf0c087703
  end
end
