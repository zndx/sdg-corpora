CREATE TABLE special_educational_needs (
  special_educational_need_id INTEGER NOT NULL,
  need_code VARCHAR(32),
  need_name VARCHAR(32),
  severity_level VARCHAR(32),
  is_primary BOOLEAN,
  requires_specialized_therapy BOOLEAN,
  student_id INTEGER,
  staff_training_module_id INTEGER,
  PRIMARY KEY (special_educational_need_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (staff_training_module_id) REFERENCES staff_training_modules (id)
);
