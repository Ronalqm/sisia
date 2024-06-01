class Student < ApplicationRecord
    has_many :grades
    has_many :attendances
    belongs_to :course


    def generate_qr_code
        RQRCode::QRCode.new(student_url(self), size: 6, level: :h)
    end
    def full_name
        "#{first_name} #{last_name}"
    end

    private

    def student_url(student)
        Rails.application.routes.url_helpers.student_summary_url(student, host: 'localhost:3000')
    end
end
  
