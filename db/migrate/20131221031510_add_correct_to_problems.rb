class AddCorrectToProblems < ActiveRecord::Migration
  def change
  	add_column :problems, :correct, :boolean, default: false
  end
end
