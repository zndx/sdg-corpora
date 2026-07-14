CREATE TABLE organizations_recruiters (
  organization_id INTEGER NOT NULL,
  recruiter_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, recruiter_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (recruiter_id) REFERENCES recruiters (recruiter_id)
);
