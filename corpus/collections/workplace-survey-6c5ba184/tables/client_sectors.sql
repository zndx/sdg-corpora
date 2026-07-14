CREATE TABLE client_sectors (
  id INTEGER NOT NULL,
  sector_id INTEGER,
  sector_name VARCHAR(32),
  sector_type VARCHAR(32),
  service_level VARCHAR(32),
  implementation_complexity VARCHAR(32),
  employee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
