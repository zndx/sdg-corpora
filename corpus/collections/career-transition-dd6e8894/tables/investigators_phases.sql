CREATE TABLE investigators_phases (
  principal_investigator_id INTEGER NOT NULL,
  phase_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (principal_investigator_id, phase_id),
  FOREIGN KEY (principal_investigator_id) REFERENCES principal_investigators (id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
