CREATE TABLE universities_members (
  university_id INTEGER NOT NULL,
  faculty_member_id INTEGER NOT NULL,
  PRIMARY KEY (university_id, faculty_member_id),
  FOREIGN KEY (university_id) REFERENCES universities (id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id)
);
