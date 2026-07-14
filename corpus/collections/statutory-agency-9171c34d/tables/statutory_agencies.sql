CREATE TABLE statutory_agencies (
  id INTEGER NOT NULL,
  agency_identifier VARCHAR(42),
  agency_name VARCHAR(37),
  parent_department VARCHAR(32),
  statutory_reference VARCHAR(32),
  fiscal_year INTEGER,
  is_consolidated BOOLEAN,
  staffing_plan_id INTEGER,
  mission_statement_id INTEGER,
  administrative_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (staffing_plan_id) REFERENCES staffing_plans (id),
  FOREIGN KEY (mission_statement_id) REFERENCES mission_statements (id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id)
);
