CREATE TABLE regional_commissions (
  id INTEGER NOT NULL,
  commission_code VARCHAR(44),
  established_date DATE,
  jurisdiction VARCHAR(32),
  commission_type VARCHAR(32),
  operational_status VARCHAR(32),
  quality_assurance_system_id INTEGER,
  university_code VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id),
  FOREIGN KEY (university_code) REFERENCES universities (university_code)
);
