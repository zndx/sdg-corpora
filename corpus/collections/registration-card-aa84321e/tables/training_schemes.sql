CREATE TABLE training_schemes (
  id INTEGER NOT NULL,
  scheme_code VARCHAR(32),
  scheme_name VARCHAR(32),
  scheme_type VARCHAR(32),
  is_smart_metering BOOLEAN,
  PRIMARY KEY (id)
);
