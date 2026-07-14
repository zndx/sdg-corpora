CREATE TABLE training_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  duration_hours INTEGER,
  target_audience VARCHAR(32),
  completion_rate DECIMAL,
  effectiveness_rating VARCHAR(32),
  nutrition_unit_id INTEGER,
  staff_member_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (nutrition_unit_id) REFERENCES nutrition_units (id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id)
);
