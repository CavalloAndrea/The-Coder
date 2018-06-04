class UsersController < ApplicationController

	before_action :logged_in_user, only: [:index,:edit, :update, :destroy, :following, :followers]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user, 	   only: :destroy

  def index
  	@users = User.paginate(page: params[:page])
  end

  def show
  @user = User.find(params[:id])
  @microposts = @user.microposts.paginate(page: params[:page])
end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		@user.send_activation_email
  		flash[:info] = "Controlla la tua casella email per attivare il tuo account"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      params[:user][:privato] == '1' ? @user.update_attributes(privato: true) : @user.update_attributes(privato: false)
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

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def friends
        @friends = Array.new
        if current_user.oauth_token.present?
            graph = Koala::Facebook::API.new(current_user.oauth_token)
            @friends = graph.get_connections("me", "friends")
        end
    end

  private

  def user_params
  	params.require(:user).permit(:name,:nickname,:eta,:sesso,:istruzione,:privato,:linguaggi, :email, :password, :password_confirmation)
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
