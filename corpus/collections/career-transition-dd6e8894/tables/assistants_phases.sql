CREATE TABLE assistants_phases (
  research_assistant_id INTEGER NOT NULL,
  phase_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (research_assistant_id, phase_id),
  FOREIGN KEY (research_assistant_id) REFERENCES research_assistants (id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
