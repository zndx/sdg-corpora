CREATE TABLE instruments_records (
  instrument_code INTEGER NOT NULL,
  student_assessment_record_id INTEGER NOT NULL,
  PRIMARY KEY (instrument_code, student_assessment_record_id),
  FOREIGN KEY (instrument_code) REFERENCES assessment_instruments (instrument_code),
  FOREIGN KEY (student_assessment_record_id) REFERENCES student_assessment_records (student_assessment_record_id)
);
