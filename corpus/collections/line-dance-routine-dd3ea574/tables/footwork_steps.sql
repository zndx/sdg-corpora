CREATE TABLE footwork_steps (
  footwork_step_id INTEGER NOT NULL,
  step_name VARCHAR(32),
  foot_used VARCHAR(32),
  direction VARCHAR(32),
  turn_angle DECIMAL,
  execution_count INTEGER,
  step_type VARCHAR(32),
  dance_section_id INTEGER,
  PRIMARY KEY (footwork_step_id),
  FOREIGN KEY (dance_section_id) REFERENCES dance_sections (id)
);
