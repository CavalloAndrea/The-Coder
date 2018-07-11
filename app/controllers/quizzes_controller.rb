class QuizzesController < ApplicationController
  def show
		@quiz = Quiz.find(params[:id])
	end

	def new
		@quiz = Quiz.new
	end


	def index
		@quiz = Quiz.paginate(page: params[:page])
	end

	def create
		@quiz = Quiz.new(quiz_params)
		if @quiz.save
			flash[:success] = "Quiz aggiunto correttamente!"
			redirect_to root_path
		else
			render 'new'
		end
	end


	private

	def quiz_params
		params.require(:quiz).permit(:titolo, :d1, :d2, :d3,:d4, :d5, :g1, :g2, :g3,:g4, :g5,:r1_1, :r1_2, :r1_3,:r2_1, :r2_2,:r2_3,:r3_1, :r3_2,:r3_3,:r4_1, :r4_2,:r4_3,:r5_1, :r5_2,:r5_3,:next)
	end
end
