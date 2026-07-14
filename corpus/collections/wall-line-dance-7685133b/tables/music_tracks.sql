CREATE TABLE music_tracks (
  id INTEGER NOT NULL,
  track_id VARCHAR(44),
  title VARCHAR(32),
  artist_name VARCHAR(32),
  album_title VARCHAR(32),
  tempo_bpm INTEGER,
  duration_seconds DECIMAL,
  release_year INTEGER,
  wall_line_dance_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (wall_line_dance_id) REFERENCES wall_line_dances (id)
);
