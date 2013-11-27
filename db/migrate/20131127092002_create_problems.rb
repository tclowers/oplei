class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :exam_id
      t.integer :fact_id

      t.timestamps
    end
  end
end
