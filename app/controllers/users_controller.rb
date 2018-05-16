class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])

  end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Benvenuto su The Coder"
  		redirect_to @user
  		#salva con successo
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
