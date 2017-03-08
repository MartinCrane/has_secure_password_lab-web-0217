
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      user.save

      session[:user_id] = user.id
      @user = user
      redirect_to '/users/show'
    else
       redirect_to '/users/new'
    end
  end

  def destroy
    # session.delete :name
    # redirect_to '/'
  end

  private

  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
