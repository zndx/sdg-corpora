CREATE TABLE dances_sections (
  wall_line_dance_id INTEGER NOT NULL,
  section_id INTEGER NOT NULL,
  PRIMARY KEY (wall_line_dance_id, section_id),
  FOREIGN KEY (wall_line_dance_id) REFERENCES wall_line_dances (id),
  FOREIGN KEY (section_id) REFERENCES dance_sections (section_id)
);
