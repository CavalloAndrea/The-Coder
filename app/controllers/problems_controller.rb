class ProblemsController < ApplicationController
	def new
		@problem = Problem.new
	end

	def show
		@problem = Problem.find(params[:id])
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
