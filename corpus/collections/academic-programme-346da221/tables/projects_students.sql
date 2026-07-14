CREATE TABLE projects_students (
  project_id VARCHAR(44) NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (project_id, student_id),
  FOREIGN KEY (project_id) REFERENCES research_projects (project_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
