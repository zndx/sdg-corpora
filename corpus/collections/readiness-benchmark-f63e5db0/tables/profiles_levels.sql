CREATE TABLE profiles_levels (
  student_profile_id INTEGER NOT NULL,
  course_level_id INTEGER NOT NULL,
  PRIMARY KEY (student_profile_id, course_level_id),
  FOREIGN KEY (student_profile_id) REFERENCES student_profiles (student_profile_id),
  FOREIGN KEY (course_level_id) REFERENCES course_levels (course_level_id)
);
