CREATE TABLE cred_organizations (
  organization_id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  organization_type VARCHAR(34),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  award_id INTEGER,
  scholarship_fund_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (award_id) REFERENCES cred_awards (id),
  FOREIGN KEY (scholarship_fund_id) REFERENCES cred_scholarship_funds (id)
);
