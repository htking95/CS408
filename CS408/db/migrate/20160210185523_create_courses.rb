class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :department
      t.text :description
      t.datetime :lastEdited
      t.integer :average
      t.string :gradeAverage
      t.integer :numReviews

      t.timestamps null: false
    end
  end
end
