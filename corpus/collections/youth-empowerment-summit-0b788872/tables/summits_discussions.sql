CREATE TABLE summits_discussions (
  youth_empowerment_summit_id INTEGER NOT NULL,
  panel_discussion_panel_id INTEGER NOT NULL,
  PRIMARY KEY (youth_empowerment_summit_id, panel_discussion_panel_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id),
  FOREIGN KEY (panel_discussion_panel_id) REFERENCES panel_discussions (panel_id)
);
