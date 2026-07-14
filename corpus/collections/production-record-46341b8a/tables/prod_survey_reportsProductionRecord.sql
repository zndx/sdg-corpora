CREATE TABLE prod_survey_reportsProductionRecord (
  survey_report_id INTEGER NOT NULL,
  production_record_id INTEGER NOT NULL,
  PRIMARY KEY (survey_report_id, production_record_id),
  FOREIGN KEY (survey_report_id) REFERENCES prod_survey_reports (id),
  FOREIGN KEY (production_record_id) REFERENCES prod_production_records (id)
);
