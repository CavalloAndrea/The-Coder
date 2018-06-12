class TutorialsController < ApplicationController
	
	def show
		@tutorial = Tutorial.find(params[:id])
	end

	def new
		@tutorial = Tutorial.new
	end

	def quiz
		linguaggio = params[:linguaggio]
		@linguaggio = Tutorial.where("linguaggio ==?","#{linguaggio}")
	end

	def esercizio
		linguaggio = params[:linguaggio]
		@linguaggio = Tutorial.where("linguaggio ==?","#{linguaggio}")
	end

	def index
		@tutorials = Tutorial.paginate(page: params[:page])
	end

	def create
		@tutorial = Tutorial.new(tutorial_params)
		if @tutorial.save
			flash[:success] = "Tutorial aggiunto correttamente!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def searching
		searchword = params[:searching]
		linguaggio = params[:linguaggio]
		if linguaggio.blank?
			@data = Tutorial.where("((titolo LIKE ?) or (lezione LIKE ?))", "%#{searchword}%","%#{searchword}%")
		else
			@data = Tutorial.where("((titolo LIKE ?) or (lezione LIKE ?)) and linguaggio == ?","%#{searchword}%","%#{searchword}%","#{linguaggio}")
		end
	end

	private

	def tutorial_params
		params.require(:tutorial).permit(:titolo, :lezione, :linguaggio, :quiz)
	end
end
