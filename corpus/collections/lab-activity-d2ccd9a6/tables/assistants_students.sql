CREATE TABLE assistants_students (
  teaching_assistant_ta_id VARCHAR(44) NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (teaching_assistant_ta_id, student_id),
  FOREIGN KEY (teaching_assistant_ta_id) REFERENCES teaching_assistants (ta_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
