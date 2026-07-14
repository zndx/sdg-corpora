CREATE TABLE academic_terms (
  term_id VARCHAR(32) NOT NULL,
  term_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  semester_hours_required INTEGER,
  term_type VARCHAR(32),
  credit_hour_requirement_id INTEGER,
  PRIMARY KEY (term_id),
  FOREIGN KEY (credit_hour_requirement_id) REFERENCES credit_hour_requirements (credit_hour_requirement_id)
);
