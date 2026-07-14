CREATE TABLE professional_memberships (
  id INTEGER NOT NULL,
  membership_id VARCHAR(32),
  organization_name VARCHAR(32),
  certification_level VARCHAR(32),
  issue_date DATE,
  expiry_date DATE,
  coach_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (coach_id) REFERENCES coaches (id)
);
