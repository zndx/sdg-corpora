CREATE TABLE academic_qualifications (
  qual_id VARCHAR(32) NOT NULL,
  degree_type VARCHAR(32),
  field_of_study VARCHAR(32),
  awarding_institution VARCHAR(32),
  graduation_year INTEGER,
  distinction VARCHAR(32),
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (qual_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
