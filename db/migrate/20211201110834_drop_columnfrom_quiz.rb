class DropColumnfromQuiz < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :course_id, :integer
   
  end
end
