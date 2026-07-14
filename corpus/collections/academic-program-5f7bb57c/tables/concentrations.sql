CREATE TABLE concentrations (
  id INTEGER NOT NULL,
  concentration_name VARCHAR(32),
  focus_area VARCHAR(32),
  methodology_type VARCHAR(32),
  is_core BOOLEAN,
  academic_program_id INTEGER,
  statistical_method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (statistical_method_id) REFERENCES statistical_methods (statistical_method_id)
);
