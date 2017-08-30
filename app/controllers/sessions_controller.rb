class SessionsController < ApplicationController
  def new
    @session = User.new
  end
  def log_in(user)
    session[:user_id] = user.id
    redirect_to :root, notice: 'Logged in'
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end
