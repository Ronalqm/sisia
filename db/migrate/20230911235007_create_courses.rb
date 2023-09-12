class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :number_of_subjects

      t.timestamps
    end
  end
end
