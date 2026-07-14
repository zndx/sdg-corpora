CREATE TABLE researchers (
  id INTEGER NOT NULL,
  researcher_identifier VARCHAR(32),
  full_legal_name VARCHAR(32),
  primary_degree VARCHAR(32),
  secondary_degree VARCHAR(32),
  current_institution VARCHAR(32),
  current_title VARCHAR(32),
  research_focus VARCHAR(32),
  academic_award_id INTEGER,
  leadership_position_id INTEGER,
  academic_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_award_id) REFERENCES academic_awards (academic_award_id),
  FOREIGN KEY (leadership_position_id) REFERENCES leadership_positions (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (academic_institution_id)
);
