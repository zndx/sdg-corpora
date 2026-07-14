CREATE TABLE medical_professionals (
  medical_professional_id INTEGER NOT NULL,
  professional_i_d VARCHAR(32),
  full_name VARCHAR(36),
  medical_license_number VARCHAR(32),
  employment_status VARCHAR(32),
  specialty VARCHAR(32),
  ethical_decision_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY (medical_professional_id),
  FOREIGN KEY (ethical_decision_id) REFERENCES ethical_decisions (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
