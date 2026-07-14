CREATE TABLE shoo_competition_results (
  id INTEGER NOT NULL,
  result_id VARCHAR(44),
  qualification_score INTEGER,
  final_score DECIMAL,
  aggregate_score DECIMAL,
  rank INTEGER,
  medal VARCHAR(32),
  status VARCHAR(32),
  shooter_id INTEGER,
  discipline_id INTEGER,
  event_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id),
  FOREIGN KEY (discipline_id) REFERENCES shoo_disciplines (id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id)
);
