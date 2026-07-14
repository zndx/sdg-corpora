CREATE TABLE prod_production_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  volume DECIMAL,
  unit VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  source VARCHAR(32),
  survey_report_id INTEGER,
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (survey_report_id) REFERENCES prod_survey_reports (id),
  FOREIGN KEY (geographic_region_id) REFERENCES prod_geographic_regions (id)
);
