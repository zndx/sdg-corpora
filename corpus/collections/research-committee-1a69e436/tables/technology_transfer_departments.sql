CREATE TABLE technology_transfer_departments (
  id INTEGER NOT NULL,
  department_id VARCHAR(32),
  name VARCHAR(32),
  established_date DATE,
  status VARCHAR(32),
  administrative_director_id INTEGER,
  technology_transfer_vice_president_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_director_id) REFERENCES administrative_directors (administrative_director_id),
  FOREIGN KEY (technology_transfer_vice_president_id) REFERENCES technology_transfer_vice_presidents (technology_transfer_vice_president_id)
);
