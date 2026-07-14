CREATE TABLE planning_applications (
  id INTEGER NOT NULL,
  application_id VARCHAR(32),
  status VARCHAR(32),
  submission_date DATE,
  proposal_type VARCHAR(32),
  total_floor_area DECIMAL,
  total_height INTEGER,
  land_parcel_id INTEGER,
  authority_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (id),
  FOREIGN KEY (authority_id) REFERENCES local_authorities (authority_id)
);
