CREATE TABLE organizations_facilities (
  managing_organization_id INTEGER NOT NULL,
  observatory_facility_id INTEGER NOT NULL,
  PRIMARY KEY (managing_organization_id, observatory_facility_id),
  FOREIGN KEY (managing_organization_id) REFERENCES managing_organizations (id),
  FOREIGN KEY (observatory_facility_id) REFERENCES observatory_facilities (id)
);
