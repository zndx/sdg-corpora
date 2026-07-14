CREATE TABLE teaching_assistants (
  ta_id VARCHAR(44) NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  assigned_course VARCHAR(32),
  hours_per_week INTEGER,
  faculty_member_id INTEGER,
  PRIMARY KEY (ta_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id)
);
