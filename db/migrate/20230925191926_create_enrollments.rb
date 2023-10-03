class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.date :enrollment_date

      t.timestamps
    end
  end
end
