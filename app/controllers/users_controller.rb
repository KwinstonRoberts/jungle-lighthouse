class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def log_in(user)
    current_user = user.id
    redirect_to :root,,

  notice: 'Logged in'
  end
  def create
    @user = User.new(user_params)
    if user = User.authenticate_with_credentials(params[:email],,

  params[:password])
      user.save
      log_in user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,,


      :email,,


      :password
        )
  end

end
