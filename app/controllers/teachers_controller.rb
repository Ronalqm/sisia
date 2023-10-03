class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show, :edit, :update, :update_status, :destroy]
  
    def index
        @teachers = Teacher.all
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
    
        if @teacher.save
          flash[:success] = 'Profesor creado exitosamente.'
          redirect_to teachers_path
        else
          render 'new'
        end
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:id])
    
        if @teacher.update(teacher_params)
          flash[:success] = 'Profesor actualizado exitosamente.'
          redirect_to teachers_path
        else
          render 'edit'
        end
    end

    def update_status
        new_status = @teacher.status == 'Present' ? 'Not present' : 'Present'
        if @teacher.update(status: new_status)
          flash[:success] = "Estado del profesor actualizado a '#{new_status}'."
        else
          flash[:error] = 'Hubo un problema al actualizar el estado del profesor.'
        end
        redirect_to teachers_path
    end

    # Otras acciones existentes...

    private

    def set_teacher
        @teacher = Teacher.find(params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(
          :identification_number,
          :first_name,
          :last_name,
          :middle_name,
          :gender,
          :date_of_birth,
          :address,
          :status,
          :email,
          :profession
        )
      end
end
