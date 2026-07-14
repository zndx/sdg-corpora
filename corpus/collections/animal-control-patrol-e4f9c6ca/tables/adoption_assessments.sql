CREATE TABLE adoption_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  temperament_score INTEGER,
  health_score INTEGER,
  adoptability_rating VARCHAR(32),
  special_needs BOOLEAN,
  assessor_id VARCHAR(44),
  animal_id INTEGER,
  officer_id INTEGER,
  adoption_record_adoption_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (officer_id) REFERENCES animal_services_officers (officer_id),
  FOREIGN KEY (adoption_record_adoption_id) REFERENCES adoption_records (adoption_id)
);
