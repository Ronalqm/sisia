class Course < ApplicationRecord
    has_many :enrollments
    has_many :students, through: :enrollments
    has_many :students
    has_many :subjects
end
  