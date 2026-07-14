CREATE TABLE shoo_shootersShootingEvent (
  shooter_id INTEGER NOT NULL,
  event_id VARCHAR(35) NOT NULL,
  PRIMARY KEY (shooter_id, event_id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id)
);
