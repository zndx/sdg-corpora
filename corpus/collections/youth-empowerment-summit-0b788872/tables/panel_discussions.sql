CREATE TABLE panel_discussions (
  panel_id INTEGER NOT NULL,
  panel_theme VARCHAR(32),
  number_of_panelists INTEGER,
  moderator_name VARCHAR(32),
  is_recorded BOOLEAN,
  discussion_focus VARCHAR(32),
  youth_empowerment_summit_id INTEGER,
  PRIMARY KEY (panel_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id)
);
