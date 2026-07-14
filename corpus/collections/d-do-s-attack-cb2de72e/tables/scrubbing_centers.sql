CREATE TABLE scrubbing_centers (
  id INTEGER NOT NULL,
  center_id VARCHAR(32),
  location VARCHAR(32),
  current_load_percent DECIMAL,
  is_accepting_traffic BOOLEAN,
  last_traffic_redirect TIMESTAMP,
  d_do_s_attack_id INTEGER,
  athena_platform_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (d_do_s_attack_id) REFERENCES d_do_s_attacks (id),
  FOREIGN KEY (athena_platform_id) REFERENCES athena_platforms (id)
);
