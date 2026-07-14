CREATE TABLE colloquiums (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  title VARCHAR(32),
  scheduled_date TIMESTAMP,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  status VARCHAR(32),
  registration_required BOOLEAN,
  speaker_id INTEGER,
  venue_room_number VARCHAR(32),
  series_id INTEGER,
  abstract_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (speaker_id) REFERENCES speakers (speaker_id),
  FOREIGN KEY (venue_room_number) REFERENCES venues (room_number),
  FOREIGN KEY (series_id) REFERENCES serieses (series_id),
  FOREIGN KEY (abstract_id) REFERENCES abstracts (abstract_id)
);
