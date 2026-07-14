CREATE TABLE faculty_members (
  id INTEGER NOT NULL,
  faculty_id VARCHAR(44),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  department VARCHAR(32),
  email VARCHAR(32),
  years_of_service INTEGER,
  teaching_assistant_ta_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (teaching_assistant_ta_id) REFERENCES teaching_assistants (ta_id)
);
