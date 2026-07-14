CREATE TABLE administrative_units (
  id INTEGER NOT NULL,
  unit_code INTEGER,
  unit_name VARCHAR(32),
  support_type VARCHAR(32),
  staff_count INTEGER,
  budget_allocation VARCHAR(32),
  statutory_agency_id INTEGER,
  staffing_plan_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (statutory_agency_id) REFERENCES statutory_agencies (id),
  FOREIGN KEY (staffing_plan_id) REFERENCES staffing_plans (id)
);
