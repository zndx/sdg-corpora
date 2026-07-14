CREATE TABLE shoo_disciplines (
  id INTEGER NOT NULL,
  discipline_id INTEGER,
  discipline_name VARCHAR(32),
  weapon_type VARCHAR(32),
  distance DECIMAL,
  gender_category VARCHAR(32),
  format VARCHAR(32),
  event_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id)
);
