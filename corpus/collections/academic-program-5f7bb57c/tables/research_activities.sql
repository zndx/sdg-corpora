CREATE TABLE research_activities (
  id INTEGER NOT NULL,
  activity_i_d VARCHAR(32),
  activity_type VARCHAR(32),
  study_design VARCHAR(32),
  data_source VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  statistical_method_id INTEGER,
  competency_id INTEGER,
  professional_role_id INTEGER,
  involves_collaborator_professional_role_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statistical_method_id) REFERENCES statistical_methods (statistical_method_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (id),
  FOREIGN KEY (involves_collaborator_professional_role_id) REFERENCES professional_roles (id)
);
