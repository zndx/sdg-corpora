CREATE TABLE facilities (
  id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  address VARCHAR(32),
  permit_number VARCHAR(32),
  operational_status VARCHAR(32),
  last_inspection_date DATE,
  chemical_activity_id INTEGER,
  environmental_authority_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_activity_id) REFERENCES chemical_activities (id),
  FOREIGN KEY (environmental_authority_id) REFERENCES environmental_authorities (environmental_authority_id)
);
