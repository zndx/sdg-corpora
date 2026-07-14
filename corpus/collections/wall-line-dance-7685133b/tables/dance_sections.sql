CREATE TABLE dance_sections (
  section_id INTEGER NOT NULL,
  section_number INTEGER,
  count_range VARCHAR(32),
  actual_footwork VARCHAR(32),
  calling_suggestion VARCHAR(32),
  step_count INTEGER,
  wall_line_dance_id INTEGER,
  PRIMARY KEY (section_id),
  FOREIGN KEY (wall_line_dance_id) REFERENCES wall_line_dances (id)
);
