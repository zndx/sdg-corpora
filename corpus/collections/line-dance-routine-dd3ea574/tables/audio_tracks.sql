CREATE TABLE audio_tracks (
  id INTEGER NOT NULL,
  track_title VARCHAR(32),
  artist_name VARCHAR(32),
  album_title VARCHAR(32),
  tempo_bpm INTEGER,
  total_duration_seconds INTEGER,
  line_dance_routine_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (line_dance_routine_id) REFERENCES line_dance_routines (id)
);
