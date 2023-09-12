class Subject < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
end
