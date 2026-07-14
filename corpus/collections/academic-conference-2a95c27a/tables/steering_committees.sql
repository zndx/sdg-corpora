CREATE TABLE steering_committees (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  role VARCHAR(32),
  responsibility_level VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  programme_committee_id INTEGER,
  local_organization_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (programme_committee_id) REFERENCES programme_committees (programme_committee_id),
  FOREIGN KEY (local_organization_committee_id) REFERENCES local_organization_committees (id)
);
