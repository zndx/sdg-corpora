CREATE TABLE members_projects (
  faculty_member_id INTEGER NOT NULL,
  project_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (faculty_member_id, project_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id),
  FOREIGN KEY (project_id) REFERENCES research_projects (project_id)
);
