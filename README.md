# course-platform-postgresql

## Changes

- Added `teachers` as a separate table because:

  M:M
  1 user(student) can take many courses
  1 course can have many users(students)
  
  but, 
  
  1:M
  1 user(teacher) can teach many courses
  1 course can only be taught by 1 user(teacher)

  And also reduced `roles` to student or admin.

## To Do

- Unable to do the optional challenge to write a join to bring all courses and their relations. Thinking it is a left join.
  
