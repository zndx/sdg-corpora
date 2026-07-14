CREATE TABLE institutions_assessments (
  research_institution_id INTEGER NOT NULL,
  cognitive_assessment_administrator_i_d VARCHAR(32) NOT NULL,
  PRIMARY KEY (research_institution_id, cognitive_assessment_administrator_i_d),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (research_institution_id),
  FOREIGN KEY (cognitive_assessment_administrator_i_d) REFERENCES cognitive_assessments (administrator_i_d)
);
