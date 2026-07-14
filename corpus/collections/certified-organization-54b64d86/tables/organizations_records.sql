CREATE TABLE organizations_records (
  certified_organization_id INTEGER NOT NULL,
  certification_record_id INTEGER NOT NULL,
  PRIMARY KEY (certified_organization_id, certification_record_id),
  FOREIGN KEY (certified_organization_id) REFERENCES certified_organizations (id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (id)
);
