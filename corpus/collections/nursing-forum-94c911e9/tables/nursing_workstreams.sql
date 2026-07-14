CREATE TABLE nursing_workstreams (
  id INTEGER NOT NULL,
  workstream_identifier VARCHAR(32),
  workstream_title VARCHAR(50),
  start_date DATE,
  target_outcome VARCHAR(37),
  success_metric VARCHAR(32),
  nursing_leader_id INTEGER,
  nursing_forum_id INTEGER,
  n_h_s_foundation_trust_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (n_h_s_foundation_trust_id) REFERENCES n_h_s_foundation_trusts (id)
);
