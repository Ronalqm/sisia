class AddCourseToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :course, foreign_key: true
  end
end
