// app/assets/javascripts/attendances.js
$(document).ready(function() {
    $('#course_id, #subject_id').change(function() {
      var course_id = $('#course_id').val();
      var subject_id = $('#subject_id').val();
      $.ajax({
        url: '/attendances/load_students',
        method: 'get',
        data: { course_id: course_id, subject_id: subject_id },
        success: function(data) {
          $('#students_list').html(data);
        }
      });
    });
  });
  