class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :userID
      t.integer :course_id
      t.timestamps null: false
    end
  end
end
