CREATE TABLE geographic_regions (
  geographic_region_id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  country VARCHAR(32),
  demographic_survey_id INTEGER,
  record_id INTEGER,
  education_enrollment_id INTEGER,
  child_labor_statistic_id INTEGER,
  poverty_index_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (geographic_region_id),
  FOREIGN KEY (demographic_survey_id) REFERENCES demographic_surveys (demographic_survey_id),
  FOREIGN KEY (record_id) REFERENCES health_mortality_records (record_id),
  FOREIGN KEY (education_enrollment_id) REFERENCES education_enrollments (id),
  FOREIGN KEY (child_labor_statistic_id) REFERENCES child_labor_statistics (id),
  FOREIGN KEY (poverty_index_id) REFERENCES poverty_indexes (poverty_index_id)
);
