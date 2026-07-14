CREATE TABLE marking_schemes (
  marking_scheme_id INTEGER NOT NULL,
  scheme_identifier VARCHAR(32),
  academic_session VARCHAR(32),
  subject_code VARCHAR(40),
  total_marks INTEGER,
  duration_minutes INTEGER,
  version VARCHAR(32),
  assessment_item_id INTEGER,
  PRIMARY KEY (marking_scheme_id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id)
);
