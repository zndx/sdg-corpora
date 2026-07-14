CREATE TABLE academic_conferences (
  identifier VARCHAR(32),
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  region_code VARCHAR(40) NOT NULL,
  academic_institution_id INTEGER,
  learned_society_id INTEGER,
  steering_committee_id INTEGER,
  programme_committee_id INTEGER,
  local_organization_committee_id INTEGER,
  PRIMARY KEY (region_code),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (learned_society_id) REFERENCES learned_societies (learned_society_id),
  FOREIGN KEY (steering_committee_id) REFERENCES steering_committees (id),
  FOREIGN KEY (programme_committee_id) REFERENCES programme_committees (programme_committee_id),
  FOREIGN KEY (local_organization_committee_id) REFERENCES local_organization_committees (id)
);
