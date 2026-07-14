CREATE TABLE shoo_shootersCompetitionResult (
  shooter_id INTEGER NOT NULL,
  competition_result_id INTEGER NOT NULL,
  PRIMARY KEY (shooter_id, competition_result_id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id),
  FOREIGN KEY (competition_result_id) REFERENCES shoo_competition_results (id)
);
