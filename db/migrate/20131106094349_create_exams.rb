class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.datetime :completed

      t.timestamps
    end
  end
end
