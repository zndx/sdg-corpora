CREATE TABLE grants_phases (
  funding_grant_id INTEGER NOT NULL,
  phase_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (funding_grant_id, phase_id),
  FOREIGN KEY (funding_grant_id) REFERENCES funding_grants (funding_grant_id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
