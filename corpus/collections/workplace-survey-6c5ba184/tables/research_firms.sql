CREATE TABLE research_firms (
  research_firm_id INTEGER NOT NULL,
  firm_id VARCHAR(44),
  firm_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  founding_year INTEGER,
  b_corp_member BOOLEAN,
  specialization VARCHAR(32),
  consulting_services BOOLEAN,
  organization_id INTEGER,
  PRIMARY KEY (research_firm_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
