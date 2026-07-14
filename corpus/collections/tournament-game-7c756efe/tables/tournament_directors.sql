CREATE TABLE tournament_directors (
  td_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email_address VARCHAR(32),
  jurisdiction VARCHAR(32),
  active_games_count INTEGER,
  dispute_resolution_log VARCHAR(32),
  PRIMARY KEY (td_id)
);
