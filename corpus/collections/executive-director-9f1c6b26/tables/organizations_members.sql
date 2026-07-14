CREATE TABLE organizations_members (
  organization_id INTEGER NOT NULL,
  staff_member_staff_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, staff_member_staff_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
