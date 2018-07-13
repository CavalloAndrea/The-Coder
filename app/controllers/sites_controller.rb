class SitesController < ApplicationController
  def index
	#@sites = Site.all
	redirect_to root_path
	end

  # GET /sites/1
  # GET /sites/1.json
  def show
	  redirect_to root_path
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
def edit
	redirect_to root_path
end


def create
#@site = Site.new(site_path)
	if Site.nil?
		@site = Site.new(sospeso: false)
	else 
		@site = Site.find(1)
	end

end


	
def sospendi
    if current_user.admin? 
      Site.first.update_attributes(sospeso: true)
	  flash[:success] = "The Coder aggiornato"
      redirect_to root_path
    end
  end
    
  def ristabilisci
    if current_user.admin? 
      Site.first.update_attributes(sospeso: false)
	  flash[:success] = "The Coder aggiornato"
      redirect_to root_path
    end
  end
    
  def update
    params[:site][:sospeso] == '1' ? sospendi : ristabilisci
  end


end
