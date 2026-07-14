CREATE TABLE youth_participants (
  id INTEGER NOT NULL,
  participant_id VARCHAR(44),
  full_name VARCHAR(36),
  grade_level VARCHAR(32),
  school_affiliation VARCHAR(32),
  identity_group VARCHAR(32),
  role VARCHAR(32),
  youth_empowerment_summit_id INTEGER,
  educational_institution_id INTEGER,
  panel_discussion_panel_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (educational_institution_id),
  FOREIGN KEY (panel_discussion_panel_id) REFERENCES panel_discussions (panel_id)
);
