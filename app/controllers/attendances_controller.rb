class AttendancesController < ApplicationController
  def select_course
    @courses = Course.all
  end

  def select_subject
    @subjects = Subject.where(course_id: params[:course_id])
  end

  def show_attendances
    @course_id = params[:course_id]
    @subject_id = params[:subject_id]
  
    @course = Course.find(@course_id)
    @subject = Subject.find(@subject_id)
    @students = Student.where(course_id: @course.id)
    @attendances = Attendance.where(student_id: @students.pluck(:id), subject_id: @subject.id)
  
    # Resto de tu código...
  end

  def select_course_new
    @courses = Course.all
  end
  
  def select_subject_new
    @course_id = params[:course_id]
    @subjects = Subject.where(course_id: @course_id)
  end
  
  def select_students
    @course = Course.find(params[:course_id])
    @subject = Subject.find(params[:subject_id])
    @students = Student.where(course_id: @course.id)
  end

  def create_attendances
    attendance_params = params[:attendance]
  
    attendance_params.each do |student_id, attendance_data|
      student = Student.find(student_id)
      course_id = attendance_data[:course_id]
      subject_id = attendance_data[:subject_id]
      present = attendance_data[:present] == "true" ? true : false
  
      # Crea el registro de asistencia para el estudiante
      Attendance.create(
        student_id: student_id,
        course_id: course_id,
        subject_id: subject_id,
        attendance_date: Date.today, # Puedes cambiar la fecha según tus necesidades
        descripcion: present ? "Presente" : "Ausente"
      )
    end
  
    redirect_to root_path, notice: 'Asistencias registradas exitosamente.'
  end

  def edit
    @attendance = Attendance.find(params[:id])
    @course = @attendance.course # Obtén el curso relacionado con esta asistencia
    @subject = @attendance.subject # Obtén la materia relacionada con esta asistencia
  end

  def update
    @attendance = Attendance.find(params[:id])

    if @attendance.update(attendance_params)
      redirect_to select_subject_attendances_path(course_id: params[:course_id]), notice: 'Asistencia actualizada exitosamente.'
    else
      render 'edit'
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_to select_subject_attendances_path(course_id: params[:course_id]), notice: 'Asistencia eliminada exitosamente.'
  end

  private

  def attendance_params
    params.require(:attendance).permit(:descripcion, :attendance_date)
  end
  
end
  