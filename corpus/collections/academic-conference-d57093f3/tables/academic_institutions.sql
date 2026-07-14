CREATE TABLE academic_institutions (
  id INTEGER NOT NULL,
  institution_name VARCHAR(32),
  department_name VARCHAR(32),
  city VARCHAR(32),
  postal_code VARCHAR(35),
  country VARCHAR(32),
  telephone VARCHAR(32),
  website_url VARCHAR(55),
  academic_conference_id INTEGER,
  academic_researcher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_id) REFERENCES academic_conferences (id),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id)
);
