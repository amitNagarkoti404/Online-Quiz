class DropQuizCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :quiz_categories
  end
end
