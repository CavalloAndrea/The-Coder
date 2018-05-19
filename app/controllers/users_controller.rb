class UsersController < ApplicationController

	before_action :logged_in_user, only: [:index,:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user, 	   only: :destroy

  def index
  	@users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])

  end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Benvenuto su The Coder"
  		redirect_to @user
  		#salva con successo
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profilo aggiornato correttamente"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "Utente cancellato"
  	redirect_to users_url
  end

  private

  def user_params
  	params.require(:user).permit(:name,:nickname, :email, :password, :password_confirmation)
  end

  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Devi effettuare il login"
  		redirect_to login_url
  	end
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
  	redirect_to(root_url) unless current_user.admin?	
  end

end
