class PasswordResetsController < ApplicationController
  before_action :get_user, only:[:edit,:update]
  before_action :valid_user, only:[:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
  		 @user.create_reset_digest
  		 @user.send_password_reset_email
  		 flash[:info] = "Email inviata con le istruzioni per resettare la password"
  		 redirect_to root_url
  	else
  		flash.now[:danger] = "Indirizzo email non valido"
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if password_blank?
  		flash.now[:danger] = "Il campo Password non può essere vuoto"
  		render 'edit'
  	elsif @user.update_attributes(user_params)
  		log_in @user
  		flash[:success] = "La password è stata resettata con successo!"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  private 

  def user_params
  	params.require(:user).permit(:password, :password_confirmation)
  end

  def password_blank?
  	params[:user][:password].blank?
  end

  def get_user
  	@user = User.find_by(email: params[:eamil])
  end

  def valid_user
  	unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
  		redirect_to root_url
  	end
  end

  def check_expiration
  	if @user.password_reset_expired?
  		flash[:danger] = "Il link per il reset della Password non è più valido"
  		redirect_to new_password_reset_url
  	end
  end

end

