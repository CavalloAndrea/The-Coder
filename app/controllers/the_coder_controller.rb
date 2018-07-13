class TheCoderController < ApplicationController
  def home
          return redirect_to(current_user) if current_user.present? && !current_user.admin?
    end


def sospeso
          if !current_user.nil? && current_user.admin?
                redirect_to sospeso_path unless request.fullpath == '/sospeso'
            elsif Site.find(1).sospeso? && (current_user.nil? || !current_user.admin?)
              redirect_to sospeso_path unless request.fullpath == '/sospeso'
            else redirect_to root_path
            end
      end
    
    def sospendi
           if current_user.admin?
              Site.find(1).update_attributes(sospeso: true)
              redirect_to user_path
            end
      end

  def ristabilisci
        if current_user.admin?
          Site.find(1).update_attributes(sospeso: false)
          redirect_to user_path
        end
  end

  def update
    params[:site][:sospeso] == '1' ? sospendi : ristabilisci
end
end