CREATE TABLE projects_processes (
  research_project_id INTEGER NOT NULL,
  wastewater_treatment_process_id INTEGER NOT NULL,
  PRIMARY KEY (research_project_id, wastewater_treatment_process_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id)
);
