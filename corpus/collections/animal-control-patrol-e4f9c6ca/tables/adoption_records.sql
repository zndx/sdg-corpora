CREATE TABLE adoption_records (
  adoption_id VARCHAR(44) NOT NULL,
  adoption_date DATE,
  adopter_name VARCHAR(32),
  adopter_contact VARCHAR(32),
  adoption_fee DECIMAL,
  follow_up_required BOOLEAN,
  follow_up_status VARCHAR(32),
  animal_id INTEGER,
  adoption_assessment_id INTEGER,
  PRIMARY KEY (adoption_id),
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (adoption_assessment_id) REFERENCES adoption_assessments (id)
);
