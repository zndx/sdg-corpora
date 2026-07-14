CREATE TABLE shooting_events (
  id INTEGER NOT NULL,
  event_code VARCHAR(32),
  gender_category VARCHAR(32),
  qualification_score INTEGER,
  final_score DECIMAL,
  final_rank INTEGER,
  medal_awarded VARCHAR(32),
  championship_edition_number INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (championship_edition_number) REFERENCES championships (edition_number)
);
