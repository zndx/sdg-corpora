CREATE TABLE shoo_shooting_eventsCompetitionResult (
  event_id VARCHAR(35) NOT NULL,
  competition_result_id INTEGER NOT NULL,
  PRIMARY KEY (event_id, competition_result_id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id),
  FOREIGN KEY (competition_result_id) REFERENCES shoo_competition_results (id)
);
