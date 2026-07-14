CREATE TABLE beneficiaries (
  beneficiary_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  age INTEGER,
  gender VARCHAR(32),
  location VARCHAR(32),
  vulnerability_status VARCHAR(32),
  household_id INTEGER,
  program_id INTEGER,
  activity_id INTEGER,
  belongs_household_to_household_id INTEGER,
  PRIMARY KEY (beneficiary_id),
  FOREIGN KEY (program_id) REFERENCES programs (id),
  FOREIGN KEY (activity_id) REFERENCES activities (activity_id),
  FOREIGN KEY (belongs_household_to_household_id) REFERENCES households (household_id)
);
