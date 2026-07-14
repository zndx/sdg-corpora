CREATE TABLE professional_societies (
  professional_society_id INTEGER NOT NULL,
  society_identifier VARCHAR(32),
  society_name VARCHAR(32),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  membership_count INTEGER,
  primary_discipline VARCHAR(32),
  academic_award_id INTEGER,
  researcher_id INTEGER,
  leadership_position_id INTEGER,
  PRIMARY KEY (professional_society_id),
  FOREIGN KEY (academic_award_id) REFERENCES academic_awards (academic_award_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (leadership_position_id) REFERENCES leadership_positions (id)
);
