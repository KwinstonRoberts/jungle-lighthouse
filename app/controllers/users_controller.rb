class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to :root, notice: 'Logged in'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.where(:email => params[:user][:email].downcase).first
      puts user
      if user && user.authenticate(params[:user][:password])
        log_in user

      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end


  private
  def user_params
    params.require(:user).permit(
      :email,
      :password
        )
  end

end
