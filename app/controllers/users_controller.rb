class UsersController < ApplicationController
  def landing
    @users = User.all
  end

  def login_form

  end

def login_user
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.email}!"
    redirect_to root_path
  else
    flash[:error] = "Sorry, your credentials are bad."
    render :login_form
  end
end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.email}!"
    else
      redirect_to '/users/new'
      flash[:error] = user.errors.full_messages
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def discover
    @user = User.find(params[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
