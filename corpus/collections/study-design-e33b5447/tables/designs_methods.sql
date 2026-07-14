CREATE TABLE designs_methods (
  study_design_id INTEGER NOT NULL,
  research_method_id INTEGER NOT NULL,
  PRIMARY KEY (study_design_id, research_method_id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id)
);
