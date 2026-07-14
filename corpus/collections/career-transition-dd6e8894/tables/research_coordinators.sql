CREATE TABLE research_coordinators (
  id INTEGER NOT NULL,
  coordinator_id VARCHAR(35),
  full_name VARCHAR(36),
  role VARCHAR(32),
  start_date DATE,
  end_date DATE,
  phase_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
