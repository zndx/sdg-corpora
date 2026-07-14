CREATE TABLE staffing_plans (
  id INTEGER NOT NULL,
  plan_id INTEGER,
  position_title VARCHAR(32),
  full_time_equivalent DECIMAL,
  salary_range VARCHAR(32),
  is_executive BOOLEAN,
  requires_specialized_skills BOOLEAN,
  statutory_agency_id INTEGER,
  administrative_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statutory_agency_id) REFERENCES statutory_agencies (id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id)
);
