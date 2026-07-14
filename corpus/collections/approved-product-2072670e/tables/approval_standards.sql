CREATE TABLE approval_standards (
  approval_standard_id INTEGER NOT NULL,
  standard_code VARCHAR(32),
  standard_title VARCHAR(32),
  publication_date DATE,
  issuing_organization VARCHAR(33),
  version_number VARCHAR(32),
  supersedes_approval_standard_id INTEGER,
  is_superseded_by_approval_standard_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (approval_standard_id),
  FOREIGN KEY (supersedes_approval_standard_id) REFERENCES approval_standards (approval_standard_id),
  FOREIGN KEY (is_superseded_by_approval_standard_id) REFERENCES approval_standards (approval_standard_id)
);
