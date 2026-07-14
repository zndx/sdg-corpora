CREATE TABLE student_led_business_initiatives (
  id INTEGER NOT NULL,
  initiative_id VARCHAR(44),
  initiative_name VARCHAR(32),
  status VARCHAR(32),
  founded_date DATE,
  sector VARCHAR(32),
  revenue DECIMAL,
  employee_count INTEGER,
  success_rating DECIMAL,
  student_entrepreneur_student_id VARCHAR(32),
  geographic_jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_entrepreneur_student_id) REFERENCES student_entrepreneurs (student_id),
  FOREIGN KEY (geographic_jurisdiction_id) REFERENCES geographic_jurisdictions (id)
);
