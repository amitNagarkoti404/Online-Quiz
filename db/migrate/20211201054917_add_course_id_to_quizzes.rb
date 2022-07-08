class AddCourseIdToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :course_id, :integer
    add_index :quizzes, :course_id
  end
end
