CREATE TABLE projects_members (
  project_id VARCHAR(44) NOT NULL,
  faculty_member_id INTEGER NOT NULL,
  PRIMARY KEY (project_id, faculty_member_id),
  FOREIGN KEY (project_id) REFERENCES research_projects (project_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id)
);
