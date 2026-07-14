CREATE TABLE organizations_members (
  youth_organization_org_id VARCHAR(32) NOT NULL,
  staff_member_id INTEGER NOT NULL,
  PRIMARY KEY (youth_organization_org_id, staff_member_id),
  FOREIGN KEY (youth_organization_org_id) REFERENCES youth_organizations (org_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id)
);
