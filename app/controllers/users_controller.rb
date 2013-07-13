
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @title = "Sign up"
    @user = User.new

		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
    
  def create 
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
