CREATE TABLE nursing_forums (
  nursing_forum_id INTEGER NOT NULL,
  forum_identifier VARCHAR(32),
  established_date DATE,
  current_status VARCHAR(32),
  governing_body VARCHAR(32),
  scope_of_influence VARCHAR(32),
  nursing_leader_id INTEGER,
  PRIMARY KEY (nursing_forum_id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id)
);
