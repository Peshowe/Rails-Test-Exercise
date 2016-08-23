class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
	password = User.find_by(password: params[:password])
    if user != nil and password != nil
      session[:user_id] = user.id
      session[:user_email] = user.email
	  session[:user_type] = "User"
      redirect_to conversations_path
    else
	  user = Trainer.find_by(email: params[:email])
	  password = Trainer.find_by(password: params[:password])
	  if user != nil and password != nil
		session[:user_id] = user.id
		session[:user_email] = user.email
		session[:user_type] = "Trainer"
		redirect_to conversations_path
	  else
		redirect_to login_url, alert: "Invalid email or password"
	  end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "Logged out"
  end
end
