class AddCollegeIdToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_column :departments, :college_id, :integer
    add_index :departments, :college_id
  end
end
