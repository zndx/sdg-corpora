CREATE TABLE shoo_disciplinesCompetitionResult (
  discipline_id INTEGER NOT NULL,
  competition_result_id INTEGER NOT NULL,
  PRIMARY KEY (discipline_id, competition_result_id),
  FOREIGN KEY (discipline_id) REFERENCES shoo_disciplines (id),
  FOREIGN KEY (competition_result_id) REFERENCES shoo_competition_results (id)
);
