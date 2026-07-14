CREATE TABLE members_activities (
  faculty_member_id INTEGER NOT NULL,
  lab_activity_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, lab_activity_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (lab_activity_id) REFERENCES lab_activities (lab_activity_id)
);
