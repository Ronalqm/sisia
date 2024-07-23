class StudentsController < ApplicationController
    before_action :load_students, only: [:index]
    before_action :set_student, only: [:show, :edit, :update, :update_status, :destroy, :summary, :generate_qr_code]


    def index
    end

    def new
        @student = Student.new
    end
    
    def create
       @student = Student.new(student_params)
       if @student.save
         flash[:success] = 'Estudiante creado exitosamente.'
         redirect_to students_path
       else
         render 'new'
       end
    end

    def show
    end

    def edit
    end
  
    def update
      if @student.update(student_params)
        flash[:success] = 'Estudiante actualizado exitosamente.'
        redirect_to students_path
      else
        render 'edit'
      end
    end

    def update_status
        new_status = @student.status == 'Present' ? 'Not present' : 'Present'
        if @student.update(status: new_status)
          flash[:success] = "Estado del estudiante actualizado a '#{new_status}'."
        else
          flash[:error] = 'Hubo un problema al actualizar el estado del estudiante.'
        end
        redirect_to students_path
    end


    def summary
      @grades = @student.grades
      @attendances = @student.attendances
    end

    def generate_qr_code
      qr_code = @student.generate_qr_code
      png = qr_code.as_png(size: 200)
      send_data png.to_s, type: 'image/png', disposition: 'inline'
    end

    private

    def load_students
        @students = Student.all
    end

    def student_params
      params.require(:student).permit(:identification_number, :first_name, :last_name, :middle_name, :gender, :date_of_birth, :address, :status, :email, :course_id)
    end
    

    def set_student
        @student = Student.find(params[:id])
    end
    
end
