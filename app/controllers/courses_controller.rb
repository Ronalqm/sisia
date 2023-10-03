class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
  
    def index
        @courses = Course.all
    end

    def show
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)

        if @course.save
        flash[:success] = 'Curso creado exitosamente.'
        redirect_to courses_path
        else
        render 'new'
        end
    end

    def edit
    end

    def update
        if @course.update(course_params)
        flash[:success] = 'Curso actualizado exitosamente.'
        redirect_to courses_path
        else
        render 'edit'
        end
    end

    def destroy
        @course.destroy
        flash[:success] = 'Curso eliminado exitosamente.'
        redirect_to courses_path
    end

    private

    def set_course
        @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:name, :number_of_subjects)
    end
end
