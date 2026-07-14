CREATE TABLE dance_sections (
  id INTEGER NOT NULL,
  section_index INTEGER,
  step_count_range VARCHAR(32),
  footwork_description VARCHAR(32),
  calling_suggestion VARCHAR(32),
  section_identifier VARCHAR(32),
  line_dance_routine_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (line_dance_routine_id) REFERENCES line_dance_routines (id)
);
