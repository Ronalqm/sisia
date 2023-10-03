class Student < ApplicationRecord
    has_many :grades
    has_many :attendances
    belongs_to :course

    def full_name
        "#{first_name} #{last_name}"
    end
end
  
