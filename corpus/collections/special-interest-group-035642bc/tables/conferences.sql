CREATE TABLE conferences (
  conference_id INTEGER NOT NULL,
  name VARCHAR(32),
  location VARCHAR(32),
  start_date DATE,
  end_date DATE,
  expected_attendance INTEGER,
  cluster VARCHAR(32),
  special_interest_group_id INTEGER,
  PRIMARY KEY (conference_id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id)
);
