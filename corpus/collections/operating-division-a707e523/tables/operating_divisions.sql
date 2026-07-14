CREATE TABLE operating_divisions (
  division_id VARCHAR(32) NOT NULL,
  division_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  employee_count INTEGER,
  fiscal_year INTEGER,
  PRIMARY KEY (division_id)
);
