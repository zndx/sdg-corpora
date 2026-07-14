CREATE TABLE managing_organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  agreement_start_date DATE,
  agreement_end_date DATE,
  oversight_level VARCHAR(32),
  conflict_of_interest_disclosure BOOLEAN,
  funding_agency_id INTEGER,
  land_owner_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id),
  FOREIGN KEY (land_owner_id) REFERENCES land_owners (id)
);
