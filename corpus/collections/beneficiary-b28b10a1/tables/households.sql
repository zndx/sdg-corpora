CREATE TABLE households (
  household_id INTEGER NOT NULL,
  household_head VARCHAR(32),
  number_of_members INTEGER,
  location VARCHAR(32),
  economic_status VARCHAR(32),
  vulnerability_level VARCHAR(32),
  support_received BOOLEAN,
  program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (household_id),
  FOREIGN KEY (program_id) REFERENCES programs (id)
);
