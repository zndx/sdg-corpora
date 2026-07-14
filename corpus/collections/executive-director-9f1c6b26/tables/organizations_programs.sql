CREATE TABLE organizations_programs (
  organization_id INTEGER NOT NULL,
  program_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, program_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id)
);
