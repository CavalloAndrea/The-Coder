class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		if user.activated?
  			log_in user
  			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  			redirect_back_or root_url
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

  #FACEBOOK

    
    def create_fb
        user = User.from_omniauth(request.env["omniauth.auth"])
        if user.email.blank?
            flash[:danger] = "You need to provide your email in order to sign-up with Facebook."
            redirect_to new_user_path
        else
            user.update_attribute(:activated, true)
            user.save
            log_in user
            redirect_to edit_user_path(current_user)
            
        end
    end
end
