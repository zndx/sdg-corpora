CREATE TABLE spiritual_organizations (
  spiritual_organization_id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  founding_date TIMESTAMP,
  mission_statement VARCHAR(32),
  is_non_profit BOOLEAN,
  retreat_program_id INTEGER,
  donation_id INTEGER,
  spiritual_seeker_id INTEGER,
  PRIMARY KEY (spiritual_organization_id),
  FOREIGN KEY (retreat_program_id) REFERENCES retreat_programs (id),
  FOREIGN KEY (donation_id) REFERENCES donations (id),
  FOREIGN KEY (spiritual_seeker_id) REFERENCES spiritual_seekers (spiritual_seeker_id)
);
