class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :identification_number
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :gender
      t.date :date_of_birth
      t.string :address
      t.string :status
      t.string :email

      t.timestamps
    end
  end
end
