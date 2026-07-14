CREATE TABLE administrative_directors (
  administrative_director_id INTEGER NOT NULL,
  official_name VARCHAR(32),
  title VARCHAR(32),
  appointment_date DATE,
  status VARCHAR(32),
  technology_transfer_department_id INTEGER,
  PRIMARY KEY (administrative_director_id),
  FOREIGN KEY (technology_transfer_department_id) REFERENCES technology_transfer_departments (id)
);
