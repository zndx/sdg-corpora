CREATE TABLE organizations (
  org_id VARCHAR(32) NOT NULL,
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  jurisdiction VARCHAR(32),
  established_date DATE,
  status VARCHAR(32),
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (org_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id)
);
