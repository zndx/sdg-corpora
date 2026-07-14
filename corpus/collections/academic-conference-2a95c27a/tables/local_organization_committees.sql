CREATE TABLE local_organization_committees (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  convenor_name VARCHAR(32),
  task_category VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  academic_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id)
);
