CREATE TABLE regional_qualifications_frameworks (
  id INTEGER NOT NULL,
  framework_id VARCHAR(44),
  name VARCHAR(32),
  version VARCHAR(32),
  status VARCHAR(32),
  total_levels INTEGER,
  credit_system_type VARCHAR(32),
  quality_assurance_system_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id)
);
