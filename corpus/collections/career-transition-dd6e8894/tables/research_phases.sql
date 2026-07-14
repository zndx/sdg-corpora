CREATE TABLE research_phases (
  phase_id VARCHAR(44) NOT NULL,
  phase_number INTEGER,
  focus_area VARCHAR(33),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  principal_investigator_id INTEGER,
  research_coordinator_id INTEGER,
  PRIMARY KEY (phase_id),
  FOREIGN KEY (principal_investigator_id) REFERENCES principal_investigators (id),
  FOREIGN KEY (research_coordinator_id) REFERENCES research_coordinators (id)
);
