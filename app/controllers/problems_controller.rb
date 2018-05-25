class ProblemsController < ApplicationController
	
	def index
		@problems = Problem.paginate(page: params[:page])
	end

	def new
		@problem = Problem.new
	end

	def show
		@problem = Problem.find(params[:id])
	end

	def search
		searchword = params[:search]
		linguaggio = params[:linguaggio]
		if linguaggio.blank?
			@data = Problem.where("((titolo LIKE ?) or (esercizio LIKE ?))", "%#{searchword}%","%#{searchword}%")
		else
			@data = Problem.where("((titolo LIKE ?) or (esercizio LIKE ?)) and linguaggio < ?","%#{searchword}%","%#{searchword}%","#{linguaggio}")
		end
	end

	def create
		@problem = Problem.new(problem_params)
		if @problem.save
			flash[:success] = "Esercizio aggiunto correttamente!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def problem_params
		params.require(:problem).permit(:titolo, :linguaggio, :esercizio, :soluzione)
	end
end
