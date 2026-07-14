CREATE TABLE academic_papers (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  title VARCHAR(32),
  submission_date TIMESTAMP,
  status VARCHAR(32),
  is_contributed BOOLEAN,
  author_membership_required VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  programme_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (programme_committee_id) REFERENCES programme_committees (programme_committee_id)
);
