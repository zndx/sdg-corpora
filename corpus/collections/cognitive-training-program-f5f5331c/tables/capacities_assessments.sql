CREATE TABLE capacities_assessments (
  cognitive_capacity_id INTEGER NOT NULL,
  cognitive_assessment_administrator_i_d VARCHAR(32) NOT NULL,
  PRIMARY KEY (cognitive_capacity_id, cognitive_assessment_administrator_i_d),
  FOREIGN KEY (cognitive_capacity_id) REFERENCES cognitive_capacities (cognitive_capacity_id),
  FOREIGN KEY (cognitive_assessment_administrator_i_d) REFERENCES cognitive_assessments (administrator_i_d)
);
