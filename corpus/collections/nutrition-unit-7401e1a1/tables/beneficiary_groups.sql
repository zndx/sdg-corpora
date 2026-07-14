CREATE TABLE beneficiary_groups (
  beneficiary_group_id INTEGER NOT NULL,
  group_id VARCHAR(32),
  group_name VARCHAR(32),
  age_range VARCHAR(32),
  gender VARCHAR(32),
  enrollment_date DATE,
  discharge_date DATE,
  recovery_status VARCHAR(32),
  participation_level VARCHAR(32),
  nutrition_unit_id INTEGER,
  training_program_id INTEGER,
  PRIMARY KEY (beneficiary_group_id),
  FOREIGN KEY (nutrition_unit_id) REFERENCES nutrition_units (id),
  FOREIGN KEY (training_program_id) REFERENCES training_programs (id)
);
