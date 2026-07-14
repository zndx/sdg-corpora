CREATE TABLE organizations_participants (
  youth_organization_org_id VARCHAR(32) NOT NULL,
  youth_participant_id INTEGER NOT NULL,
  PRIMARY KEY (youth_organization_org_id, youth_participant_id),
  FOREIGN KEY (youth_organization_org_id) REFERENCES youth_organizations (org_id),
  FOREIGN KEY (youth_participant_id) REFERENCES youth_participants (id)
);
