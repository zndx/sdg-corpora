CREATE TABLE wall_line_dances (
  id INTEGER NOT NULL,
  dance_id VARCHAR(32),
  title VARCHAR(32),
  level VARCHAR(32),
  total_counts INTEGER,
  music_bpm INTEGER,
  start_offset_seconds DECIMAL,
  choreographer_name VARCHAR(32),
  choreography_date DATE,
  dedication_text VARCHAR(32),
  music_track_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (music_track_id) REFERENCES music_tracks (id)
);
