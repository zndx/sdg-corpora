CREATE TABLE food_industry_applications (
  food_industry_application_id INTEGER NOT NULL,
  application_id VARCHAR(32),
  application_type VARCHAR(32),
  target_food_matrix VARCHAR(32),
  dosage DECIMAL,
  efficacy_score DECIMAL,
  food_formulation_id INTEGER,
  PRIMARY KEY (food_industry_application_id),
  FOREIGN KEY (food_formulation_id) REFERENCES food_formulations (id)
);
