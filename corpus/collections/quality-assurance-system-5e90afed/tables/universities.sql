CREATE TABLE universities (
  university_code VARCHAR(44) NOT NULL,
  institution_name VARCHAR(32),
  country VARCHAR(32),
  established_year INTEGER,
  institution_type VARCHAR(32),
  qa_compliance_level VARCHAR(32),
  quality_assurance_system_id INTEGER,
  regional_commission_id INTEGER,
  PRIMARY KEY (university_code),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id),
  FOREIGN KEY (regional_commission_id) REFERENCES regional_commissions (id)
);
