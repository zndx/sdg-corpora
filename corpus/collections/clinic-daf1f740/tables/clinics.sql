CREATE TABLE clinics (
  id INTEGER NOT NULL,
  clinic_id VARCHAR(32),
  clinic_name VARCHAR(32),
  branch_of VARCHAR(32),
  address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  has_telehealth BOOLEAN,
  program_id INTEGER,
  charting_software_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id),
  FOREIGN KEY (charting_software_id) REFERENCES charting_softwares (id)
);
