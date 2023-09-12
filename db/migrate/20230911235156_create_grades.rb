class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.string :grade_type
      t.integer :value

      t.timestamps
    end
  end
end
