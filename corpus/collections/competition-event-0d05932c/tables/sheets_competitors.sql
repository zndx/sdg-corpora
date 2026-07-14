CREATE TABLE sheets_competitors (
  score_sheet_id INTEGER NOT NULL,
  competitor_id INTEGER NOT NULL,
  PRIMARY KEY (score_sheet_id, competitor_id),
  FOREIGN KEY (score_sheet_id) REFERENCES score_sheets (score_sheet_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id)
);
