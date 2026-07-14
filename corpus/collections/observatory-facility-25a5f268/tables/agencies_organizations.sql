CREATE TABLE agencies_organizations (
  funding_agency_id INTEGER NOT NULL,
  managing_organization_id INTEGER NOT NULL,
  PRIMARY KEY (funding_agency_id, managing_organization_id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id),
  FOREIGN KEY (managing_organization_id) REFERENCES managing_organizations (id)
);
