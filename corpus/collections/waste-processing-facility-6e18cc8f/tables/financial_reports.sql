CREATE TABLE financial_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_type VARCHAR(32),
  fiscal_year INTEGER,
  reporting_period_start DATE,
  reporting_period_end DATE,
  status VARCHAR(32),
  prepared_by_staff_id VARCHAR(39),
  waste_processing_facility_id INTEGER,
  financial_staff_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (waste_processing_facility_id) REFERENCES waste_processing_facilities (waste_processing_facility_id),
  FOREIGN KEY (financial_staff_id) REFERENCES financial_staffs (id)
);
