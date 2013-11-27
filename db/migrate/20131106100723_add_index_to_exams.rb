class AddIndexToExams < ActiveRecord::Migration
  def change
    add_index :exams, :user_id
  end
end
