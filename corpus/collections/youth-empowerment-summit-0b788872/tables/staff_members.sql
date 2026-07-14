CREATE TABLE staff_members (
  staff_member_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  job_title VARCHAR(32),
  is_youth BOOLEAN,
  is_trainer BOOLEAN,
  is_moderator BOOLEAN,
  youth_organization_org_id VARCHAR(32),
  conference_workshop_id INTEGER,
  panel_discussion_panel_id INTEGER,
  PRIMARY KEY (staff_member_id),
  FOREIGN KEY (youth_organization_org_id) REFERENCES youth_organizations (org_id),
  FOREIGN KEY (conference_workshop_id) REFERENCES conference_workshops (conference_workshop_id),
  FOREIGN KEY (panel_discussion_panel_id) REFERENCES panel_discussions (panel_id)
);
