CREATE TABLE discussions_members (
  panel_discussion_panel_id INTEGER NOT NULL,
  staff_member_id INTEGER NOT NULL,
  PRIMARY KEY (panel_discussion_panel_id, staff_member_id),
  FOREIGN KEY (panel_discussion_panel_id) REFERENCES panel_discussions (panel_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id)
);
