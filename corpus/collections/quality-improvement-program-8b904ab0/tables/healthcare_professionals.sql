CREATE TABLE healthcare_professionals (
  healthcare_professional_id INTEGER NOT NULL,
  professional_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(36),
  years_of_experience INTEGER,
  certification_status VARCHAR(32),
  organization_affiliation VARCHAR(37),
  organization_org_id VARCHAR(32),
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (healthcare_professional_id),
  FOREIGN KEY (organization_org_id) REFERENCES organizations (org_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id)
);
