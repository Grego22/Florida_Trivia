class AddColumnToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :qustion_id, :integer
  end
end
