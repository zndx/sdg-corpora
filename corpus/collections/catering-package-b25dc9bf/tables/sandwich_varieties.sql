CREATE TABLE sandwich_varieties (
  id INTEGER NOT NULL,
  variety_id INTEGER,
  variety_name VARCHAR(32),
  bread_type VARCHAR(32),
  primary_protein VARCHAR(32),
  includes_cheese BOOLEAN,
  catering_package_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (id)
);
