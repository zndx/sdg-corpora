CREATE TABLE cognitive_assessments (
  assessment_identifier VARCHAR(32),
  assessment_name VARCHAR(32),
  administration_date TIMESTAMP,
  administrator_i_d VARCHAR(32) NOT NULL,
  participant_i_d VARCHAR(32),
  score DECIMAL,
  status VARCHAR(32),
  cognitive_capacity_id INTEGER,
  research_institution_id INTEGER,
  PRIMARY KEY (administrator_i_d),
  FOREIGN KEY (cognitive_capacity_id) REFERENCES cognitive_capacities (cognitive_capacity_id),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (research_institution_id)
);
