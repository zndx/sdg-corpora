CREATE TABLE departments (
  department_id VARCHAR(32) NOT NULL,
  department_name VARCHAR(32),
  head_staff_id VARCHAR(32),
  budget_allocation VARCHAR(32),
  established_date DATE,
  financial_staff_id INTEGER,
  waste_processing_facility_id INTEGER,
  financial_report_id INTEGER,
  PRIMARY KEY (department_id),
  FOREIGN KEY (financial_staff_id) REFERENCES financial_staffs (id),
  FOREIGN KEY (waste_processing_facility_id) REFERENCES waste_processing_facilities (waste_processing_facility_id),
  FOREIGN KEY (financial_report_id) REFERENCES financial_reports (id)
);
