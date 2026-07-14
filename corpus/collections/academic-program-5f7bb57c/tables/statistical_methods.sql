CREATE TABLE statistical_methods (
  statistical_method_id INTEGER NOT NULL,
  method_i_d VARCHAR(32),
  method_name VARCHAR(32),
  method_category VARCHAR(32),
  complexity_level INTEGER,
  is_standardized BOOLEAN,
  concentration_id INTEGER,
  research_activity_id INTEGER,
  professional_role_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (statistical_method_id),
  FOREIGN KEY (concentration_id) REFERENCES concentrations (id),
  FOREIGN KEY (research_activity_id) REFERENCES research_activities (id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (id)
);
