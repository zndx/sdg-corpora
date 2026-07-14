CREATE TABLE programs (
  program_id INTEGER NOT NULL,
  program_name VARCHAR(32),
  year INTEGER,
  event_count INTEGER,
  budget DECIMAL,
  status VARCHAR(32),
  executive_director_id INTEGER,
  donor_id INTEGER,
  PRIMARY KEY (program_id),
  FOREIGN KEY (executive_director_id) REFERENCES executive_directors (id),
  FOREIGN KEY (donor_id) REFERENCES donors (id)
);
