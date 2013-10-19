class AddIndexToFactQuestions < ActiveRecord::Migration
  def change
  	add_index :facts, :question, unique: true
  end
end
