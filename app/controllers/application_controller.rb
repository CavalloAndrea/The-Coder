class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :sospeso?
  include SessionsHelper

  private

# Confirms a logged-in user.
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "E' necessario accedere"
			redirect_to login_url
		end
	end

	def sospeso?
        if (Site.find(1).sospeso? && (current_user.nil? || (current_user.present? && !current_user.admin?))) && request.env['PATH_INFO'] != login_path
            redirect_to sospeso_path unless request.fullpath == '/sospeso'
        end
    end

end

