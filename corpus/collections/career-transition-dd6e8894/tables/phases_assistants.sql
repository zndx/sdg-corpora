CREATE TABLE phases_assistants (
  phase_id VARCHAR(44) NOT NULL,
  research_assistant_id INTEGER NOT NULL,
  PRIMARY KEY (phase_id, research_assistant_id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id),
  FOREIGN KEY (research_assistant_id) REFERENCES research_assistants (id)
);
