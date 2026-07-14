CREATE TABLE competitors_sheets (
  competitor_id INTEGER NOT NULL,
  score_sheet_id INTEGER NOT NULL,
  PRIMARY KEY (competitor_id, score_sheet_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id),
  FOREIGN KEY (score_sheet_id) REFERENCES score_sheets (score_sheet_id)
);
