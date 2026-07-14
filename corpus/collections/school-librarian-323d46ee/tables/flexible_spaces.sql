CREATE TABLE flexible_spaces (
  space_id VARCHAR(32) NOT NULL,
  space_name VARCHAR(32),
  space_type VARCHAR(32),
  capacity INTEGER,
  equipment_provided VARCHAR(32),
  is_bookable BOOLEAN,
  accessibility_compliant BOOLEAN,
  library_program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (space_id),
  FOREIGN KEY (library_program_id) REFERENCES library_programs (library_program_id)
);
