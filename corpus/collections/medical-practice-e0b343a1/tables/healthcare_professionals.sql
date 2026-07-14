CREATE TABLE healthcare_professionals (
  healthcare_professional_id INTEGER NOT NULL,
  professional_name VARCHAR(32),
  job_title VARCHAR(32),
  employment_status VARCHAR(32),
  qualifications VARCHAR(32),
  medical_practice_id INTEGER,
  PRIMARY KEY (healthcare_professional_id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id)
);
