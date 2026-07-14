CREATE TABLE routines_sections (
  line_dance_routine_id INTEGER NOT NULL,
  dance_section_id INTEGER NOT NULL,
  PRIMARY KEY (line_dance_routine_id, dance_section_id),
  FOREIGN KEY (line_dance_routine_id) REFERENCES line_dance_routines (id),
  FOREIGN KEY (dance_section_id) REFERENCES dance_sections (id)
);
