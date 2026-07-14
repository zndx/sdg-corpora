CREATE TABLE education_enrollments (
  id INTEGER NOT NULL,
  enrollment_id VARCHAR(32),
  academic_year VARCHAR(32),
  education_level VARCHAR(32),
  total_students INTEGER,
  dropout_rate DECIMAL,
  male_dropout_rate DECIMAL,
  female_dropout_rate DECIMAL,
  failure_rate DECIMAL,
  male_failure_rate DECIMAL,
  female_failure_rate DECIMAL,
  geographic_region_id INTEGER,
  demographic_survey_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (demographic_survey_id) REFERENCES demographic_surveys (demographic_survey_id)
);
