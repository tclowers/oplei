class RenameType < ActiveRecord::Migration
  def change
  	rename_column :facts, :type, :question_type
  end
end
