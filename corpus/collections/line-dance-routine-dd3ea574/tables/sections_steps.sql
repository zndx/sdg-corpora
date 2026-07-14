CREATE TABLE sections_steps (
  dance_section_id INTEGER NOT NULL,
  footwork_step_id INTEGER NOT NULL,
  PRIMARY KEY (dance_section_id, footwork_step_id),
  FOREIGN KEY (dance_section_id) REFERENCES dance_sections (id),
  FOREIGN KEY (footwork_step_id) REFERENCES footwork_steps (footwork_step_id)
);
