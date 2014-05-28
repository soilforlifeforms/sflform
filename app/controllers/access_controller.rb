class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_trainer = Trainer.where(:username => params[:username]).first
      if found_trainer
        authorized_trainer = found_trainer.authenticate(params[:password])
      end
    end
    if authorized_trainer
      # mark user as logged in
      session[:user_id] = authorized_trainer.id
      session[:username] = authorized_trainer.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end





