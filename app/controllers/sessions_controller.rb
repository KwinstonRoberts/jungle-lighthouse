class SessionsController < ApplicationController
  def new
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to :back,,

  notice: 'Logged in'
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.authenticate_with_credentials(params[:session][:email].downcase,,

  params[:session][:password])
      log_in user
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end
