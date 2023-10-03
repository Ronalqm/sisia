class Teacher < ApplicationRecord
    has_many :subjects

    def full_name
        "#{first_name} #{last_name}"
    end
end
  