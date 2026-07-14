CREATE TABLE profiles_records (
  student_profile_id INTEGER NOT NULL,
  student_assessment_record_id INTEGER NOT NULL,
  PRIMARY KEY (student_profile_id, student_assessment_record_id),
  FOREIGN KEY (student_profile_id) REFERENCES student_profiles (student_profile_id),
  FOREIGN KEY (student_assessment_record_id) REFERENCES student_assessment_records (student_assessment_record_id)
);
