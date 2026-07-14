CREATE TABLE projects_materials (
  research_project_id INTEGER NOT NULL,
  catalytic_material_id INTEGER NOT NULL,
  PRIMARY KEY (research_project_id, catalytic_material_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (catalytic_material_id) REFERENCES catalytic_materials (id)
);
