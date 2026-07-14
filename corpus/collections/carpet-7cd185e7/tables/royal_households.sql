CREATE TABLE royal_households (
  household_id INTEGER NOT NULL,
  location VARCHAR(32),
  ruling_dynasty VARCHAR(32),
  storage_capacity INTEGER,
  rotation_period INTEGER,
  custodian_name VARCHAR(32),
  design_pattern_id INTEGER,
  PRIMARY KEY (household_id),
  FOREIGN KEY (design_pattern_id) REFERENCES design_patterns (design_pattern_id)
);
