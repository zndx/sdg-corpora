CREATE TABLE programs (
  program_id INTEGER NOT NULL,
  program_name VARCHAR(32),
  program_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  is_online BOOLEAN,
  is_ready_made BOOLEAN,
  clinic_id INTEGER,
  PRIMARY KEY (program_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);
