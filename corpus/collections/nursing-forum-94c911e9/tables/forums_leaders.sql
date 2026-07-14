CREATE TABLE forums_leaders (
  nursing_forum_id INTEGER NOT NULL,
  nursing_leader_id INTEGER NOT NULL,
  PRIMARY KEY (nursing_forum_id, nursing_leader_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id)
);
