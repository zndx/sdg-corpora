CREATE TABLE officers (
  id INTEGER NOT NULL,
  role VARCHAR(32),
  appointment_date TIMESTAMP,
  term_end_date TIMESTAMP,
  status VARCHAR(32),
  special_interest_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id)
);
