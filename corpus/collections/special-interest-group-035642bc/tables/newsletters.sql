CREATE TABLE newsletters (
  id INTEGER NOT NULL,
  frequency VARCHAR(32),
  format VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  special_interest_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id)
);
