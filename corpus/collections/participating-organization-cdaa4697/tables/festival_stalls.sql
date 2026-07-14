CREATE TABLE festival_stalls (
  festival_stall_id INTEGER NOT NULL,
  stall_id VARCHAR(32),
  stall_location_code VARCHAR(32),
  stall_size DECIMAL,
  stall_status VARCHAR(32),
  utility_access BOOLEAN,
  festival_enrollment_id INTEGER,
  PRIMARY KEY (festival_stall_id),
  FOREIGN KEY (festival_enrollment_id) REFERENCES festival_enrollments (id)
);
