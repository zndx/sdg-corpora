CREATE TABLE organizations_officers (
  organization_id INTEGER NOT NULL,
  officer_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, officer_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (officer_id) REFERENCES officers (id)
);
