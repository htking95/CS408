json.array!(@reviews) do |review|
  json.extract! review, :id, :UserID, :CourseID, :Comment, :HelpfulCount, :Unhelpful, :FunnyCount, :FlagCount, :InstructorID, :TAs, :GradeReceived, :HoursAWeek, :TextbookRequired, :AttendanceRequired, :Semester, :YearTaken, :DepartmentID
  json.url review_url(review, format: :json)
end
