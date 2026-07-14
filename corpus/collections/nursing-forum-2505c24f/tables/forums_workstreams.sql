CREATE TABLE forums_workstreams (
  nursing_forum_id INTEGER NOT NULL,
  quality_workstream_id INTEGER NOT NULL,
  PRIMARY KEY (nursing_forum_id, quality_workstream_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (quality_workstream_id) REFERENCES quality_workstreams (quality_workstream_id)
);
