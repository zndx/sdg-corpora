CREATE TABLE student_assessment_records (
  student_assessment_record_id INTEGER NOT NULL,
  record_id INTEGER,
  student_id VARCHAR(32),
  test_date TIMESTAMP,
  score DECIMAL,
  percentile INTEGER,
  is_expired BOOLEAN,
  testing_center VARCHAR(32),
  score_report_id VARCHAR(32),
  instrument_code INTEGER,
  student_profile_id INTEGER,
  PRIMARY KEY (student_assessment_record_id),
  FOREIGN KEY (instrument_code) REFERENCES assessment_instruments (instrument_code),
  FOREIGN KEY (student_profile_id) REFERENCES student_profiles (student_profile_id)
);
