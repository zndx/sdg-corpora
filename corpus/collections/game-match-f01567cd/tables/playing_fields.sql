CREATE TABLE playing_fields (
  id INTEGER NOT NULL,
  field_id VARCHAR(44),
  length_yards DECIMAL,
  width_yards DECIMAL,
  end_zone_depth_yards DECIMAL,
  has_goal_posts BOOLEAN,
  has_hash_marks BOOLEAN,
  has_no_run_zone BOOLEAN,
  surface_type VARCHAR(32),
  match_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id)
);
