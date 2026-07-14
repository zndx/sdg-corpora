CREATE TABLE retreat_programs (
  id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location VARCHAR(32),
  is_annual BOOLEAN,
  spiritual_organization_id INTEGER,
  donation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (spiritual_organization_id) REFERENCES spiritual_organizations (spiritual_organization_id),
  FOREIGN KEY (donation_id) REFERENCES donations (id)
);
