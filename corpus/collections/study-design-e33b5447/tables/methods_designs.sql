CREATE TABLE methods_designs (
  research_method_id INTEGER NOT NULL,
  study_design_id INTEGER NOT NULL,
  PRIMARY KEY (research_method_id, study_design_id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id)
);
