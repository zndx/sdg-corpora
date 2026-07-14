CREATE TABLE events_sheets (
  competition_event_id INTEGER NOT NULL,
  score_sheet_id INTEGER NOT NULL,
  PRIMARY KEY (competition_event_id, score_sheet_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id),
  FOREIGN KEY (score_sheet_id) REFERENCES score_sheets (score_sheet_id)
);
