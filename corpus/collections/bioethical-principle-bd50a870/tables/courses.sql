CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_title VARCHAR(32),
  schedule_start TIMESTAMP,
  schedule_end TIMESTAMP,
  location VARCHAR(32),
  duration_hours DECIMAL,
  medical_professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_professional_id) REFERENCES medical_professionals (medical_professional_id)
);
