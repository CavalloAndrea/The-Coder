class AddNextToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :next, :integer
  end
end
