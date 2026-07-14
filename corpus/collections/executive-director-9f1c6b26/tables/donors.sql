CREATE TABLE donors (
  id INTEGER NOT NULL,
  donor_id VARCHAR(44),
  donor_name VARCHAR(32),
  donor_type VARCHAR(32),
  total_contributed DECIMAL,
  last_donation_date DATE,
  is_major_donor BOOLEAN,
  organization_id INTEGER,
  program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id)
);
