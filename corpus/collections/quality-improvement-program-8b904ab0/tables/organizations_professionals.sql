CREATE TABLE organizations_professionals (
  organization_org_id VARCHAR(32) NOT NULL,
  healthcare_professional_id INTEGER NOT NULL,
  PRIMARY KEY (organization_org_id, healthcare_professional_id),
  FOREIGN KEY (organization_org_id) REFERENCES organizations (org_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id)
);
