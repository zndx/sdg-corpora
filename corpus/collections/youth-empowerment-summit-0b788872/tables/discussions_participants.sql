CREATE TABLE discussions_participants (
  panel_discussion_panel_id INTEGER NOT NULL,
  youth_participant_id INTEGER NOT NULL,
  PRIMARY KEY (panel_discussion_panel_id, youth_participant_id),
  FOREIGN KEY (panel_discussion_panel_id) REFERENCES panel_discussions (panel_id),
  FOREIGN KEY (youth_participant_id) REFERENCES youth_participants (id)
);
