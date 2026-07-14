CREATE TABLE organizations_applicants (
  organization_id INTEGER NOT NULL,
  applicant_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, applicant_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id)
);
