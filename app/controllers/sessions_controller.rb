class SessionsController < ApplicationController
  def new
  end

  def create
  	trainer = Trainer.find_by username(params[:username])
  	if trainer && trainer.authenticate(params[:password])
  		session[:trainer_id] = trainer.id
  		redirect_to root_url, notice: "logged in"
  	else
  		flash.now.alert = "Username or password is invalid"
  		render "new"
  	end
  end
end
