CREATE TABLE academic_awards (
  academic_award_id INTEGER NOT NULL,
  award_identifier VARCHAR(32),
  award_name VARCHAR(32),
  issuing_organization VARCHAR(33),
  award_date TIMESTAMP,
  award_category VARCHAR(32),
  researcher_id INTEGER,
  professional_society_id INTEGER,
  PRIMARY KEY (academic_award_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (professional_society_id) REFERENCES professional_societies (professional_society_id)
);
