CREATE TABLE dance_steps (
  id INTEGER NOT NULL,
  step_id VARCHAR(40),
  step_name VARCHAR(32),
  foot_used VARCHAR(32),
  direction VARCHAR(32),
  turn_angle DECIMAL,
  execution_order INTEGER,
  section_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (section_id) REFERENCES dance_sections (section_id)
);
