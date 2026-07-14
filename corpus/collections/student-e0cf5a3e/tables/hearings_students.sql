CREATE TABLE hearings_students (
  hearing_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (hearing_id, student_id),
  FOREIGN KEY (hearing_id) REFERENCES hearings (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
