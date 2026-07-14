CREATE TABLE offenders (
  id INTEGER NOT NULL,
  offender_id INTEGER,
  full_name VARCHAR(36),
  date_of_birth DATE,
  criminal_history VARCHAR(32),
  accountability_status VARCHAR(32),
  PRIMARY KEY (id)
);
