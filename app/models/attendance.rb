class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :course
end
