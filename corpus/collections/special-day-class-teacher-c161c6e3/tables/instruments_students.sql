CREATE TABLE instruments_students (
  assessment_instrument_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (assessment_instrument_id, student_id),
  FOREIGN KEY (assessment_instrument_id) REFERENCES assessment_instruments (assessment_instrument_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
