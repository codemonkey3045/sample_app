
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
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
    else
      render 'new'
    end
  end

	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
