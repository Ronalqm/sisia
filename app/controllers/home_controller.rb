class HomeController < ApplicationController
  def index
    @news_count = News.count
    @student_count = Student.count
    @teacher_count = Teacher.count
    @course_count = Course.count
    @subject_count = Subject.count
  end
end
