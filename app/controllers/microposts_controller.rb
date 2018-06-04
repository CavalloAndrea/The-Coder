class MicropostsController < ApplicationController
	before_action :logged_in_user, only:[:create, :destroy]
	before_action :correct_user, only: :destroy
	before_action :admin_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Post pubblicato con successo!"
			redirect_to forum_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Post eliminato"
		redirect_to request.referrer || root_url
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, :picture)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end

	def admin_user

		@micropost = Users.micropost.find_by(id: params[:id])
		redirect_to(root_url) unless current_user.admin?
	end

end
