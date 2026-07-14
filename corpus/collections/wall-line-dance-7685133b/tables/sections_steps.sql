CREATE TABLE sections_steps (
  section_id INTEGER NOT NULL,
  dance_step_id INTEGER NOT NULL,
  PRIMARY KEY (section_id, dance_step_id),
  FOREIGN KEY (section_id) REFERENCES dance_sections (section_id),
  FOREIGN KEY (dance_step_id) REFERENCES dance_steps (id)
);
