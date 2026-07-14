CREATE TABLE county_executives (
  id INTEGER NOT NULL,
  executive_id VARCHAR(44),
  full_name VARCHAR(36),
  term_start_date DATE,
  term_end_date DATE,
  appointment_authority VARCHAR(32),
  county_jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (county_jurisdiction_id) REFERENCES county_jurisdictions (county_jurisdiction_id)
);
