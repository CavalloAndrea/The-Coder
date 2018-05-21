class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		if user.activated?
  			log_in user
  			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  			redirect_back_or user
  		else
  			message = "Account non attivato."
  			message += "Controlla la tua casella email per il link di attivazione"
  			flash[:warning] = message
  			redirect_to root_url
  		end

  	else
  		flash.now[:danger] = 'Email o Password non validi'	
  		render 'new'
  	end
  end

  def destroy

  	log_out if logged_in?
  	flash[:success] = 'Logout effettuato con successo. Torna a trovarci!'
  	redirect_to root_url

  end
end
