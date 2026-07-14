CREATE TABLE academic_awards (
  id INTEGER NOT NULL,
  award_id VARCHAR(44),
  name VARCHAR(32),
  awarding_organization VARCHAR(39),
  year_awarded INTEGER,
  citation VARCHAR(32),
  person_id INTEGER,
  academic_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id)
);
