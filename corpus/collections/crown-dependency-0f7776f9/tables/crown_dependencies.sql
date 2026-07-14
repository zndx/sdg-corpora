CREATE TABLE crown_dependencies (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  location VARCHAR(32),
  population INTEGER,
  economic_status VARCHAR(32),
  historical_link VARCHAR(32),
  government_department_id INTEGER,
  human_rights_instrument_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (government_department_id) REFERENCES government_departments (government_department_id),
  FOREIGN KEY (human_rights_instrument_id) REFERENCES human_rights_instruments (human_rights_instrument_id)
);
