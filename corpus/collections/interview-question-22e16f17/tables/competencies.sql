CREATE TABLE competencies (
  competency_id INTEGER NOT NULL,
  competency_name VARCHAR(32),
  category VARCHAR(32),
  proficiency_level VARCHAR(32),
  assessment_criteria VARCHAR(32),
  PRIMARY KEY (competency_id)
);
