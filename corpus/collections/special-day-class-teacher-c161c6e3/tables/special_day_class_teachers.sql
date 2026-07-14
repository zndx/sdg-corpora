CREATE TABLE special_day_class_teachers (
  special_day_class_teacher_id INTEGER NOT NULL,
  credential_type VARCHAR(32),
  employee_id VARCHAR(32),
  employment_status VARCHAR(32),
  salary_schedule VARCHAR(32),
  hire_date DATE,
  last_evaluation_date DATE,
  supervisory_role BOOLEAN,
  school_site_id INTEGER,
  PRIMARY KEY (special_day_class_teacher_id),
  FOREIGN KEY (school_site_id) REFERENCES school_sites (id)
);
