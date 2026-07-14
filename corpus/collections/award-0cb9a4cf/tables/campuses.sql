CREATE TABLE campuses (
  campus_id INTEGER NOT NULL,
  campus_name VARCHAR(32),
  campus_level VARCHAR(32),
  enrollment INTEGER,
  location VARCHAR(32),
  organization_id INTEGER,
  program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (campus_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (program_id) REFERENCES programs (id)
);
