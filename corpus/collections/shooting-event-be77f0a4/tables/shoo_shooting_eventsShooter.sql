CREATE TABLE shoo_shooting_eventsShooter (
  event_id VARCHAR(35) NOT NULL,
  shooter_id INTEGER NOT NULL,
  PRIMARY KEY (event_id, shooter_id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id)
);
