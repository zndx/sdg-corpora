CREATE TABLE tax_statutes (
  tax_statute_id INTEGER NOT NULL,
  statute_code INTEGER,
  section_number VARCHAR(32),
  enactment_date DATE,
  short_title VARCHAR(32),
  long_title VARCHAR(32),
  amendment_status VARCHAR(32),
  tax_deduction_id INTEGER,
  disqualified_activity_id INTEGER,
  PRIMARY KEY (tax_statute_id),
  FOREIGN KEY (tax_deduction_id) REFERENCES tax_deductions (tax_deduction_id),
  FOREIGN KEY (disqualified_activity_id) REFERENCES disqualified_activities (id)
);
