class GradesController < ApplicationController
  
  before_action :set_course, only: [:select_in_subject, :index, :show_index]
  before_action :set_subject, only: [:index, :show_index]

  # Resto del código...

  def show_index
    @grades = Grade.where(subject_id: @subject.id)
  end

  def select_in_course
    @courses = Course.all
  end

  def select_in_subject
    @subjects = @course.subjects
  end


  def select_course
    @courses = Course.all
  end

  def select_subject
    @course = Course.find(params[:course_id])
    @subjects = @course.subjects
  end

  def select_grade_type
    @course = Course.find(params[:course_id])
    @subject = Subject.find(params[:subject_id])
    @students = Student.where(course_id: @course.id)
  end

  def create
    course = Course.find(params[:course_id])
    subject = Subject.find(params[:subject_id])
    grade_type = params[:grade_type]
    value_max = params[:value_max].to_i

    params[:grades].each do |student_id, value|
      grade = Grade.new(
        student_id: student_id,
        subject_id: subject.id,
        grade_type: grade_type,
        value: value.to_i,
        value_max: value_max
      )
      grade.save
    end

    redirect_to root_path, notice: 'Calificaciones registradas exitosamente.'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_subject
    @subject = Subject.find_by(id: params[:subject_id], course: @course)
    redirect_to select_in_course_grades_path(course_id: @course.id) unless @subject
  end

  
end
