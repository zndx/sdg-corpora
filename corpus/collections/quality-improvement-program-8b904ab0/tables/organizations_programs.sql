CREATE TABLE organizations_programs (
  organization_org_id VARCHAR(32) NOT NULL,
  quality_improvement_program_id INTEGER NOT NULL,
  PRIMARY KEY (organization_org_id, quality_improvement_program_id),
  FOREIGN KEY (organization_org_id) REFERENCES organizations (org_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id)
);
