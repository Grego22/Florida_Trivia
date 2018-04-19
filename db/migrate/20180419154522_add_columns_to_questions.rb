class AddColumnsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option_1, :string
    add_column :questions, :option_2, :string
    add_column :questions, :option_3, :string
    add_column :questions, :correct_option, :string
  end
end
