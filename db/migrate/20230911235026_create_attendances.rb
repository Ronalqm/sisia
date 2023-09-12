class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.date :attendance_date

      t.timestamps
    end
  end
end
