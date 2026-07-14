CREATE TABLE radio_channels (
  id INTEGER NOT NULL,
  channel_id VARCHAR(44),
  channel_name VARCHAR(32),
  frequency VARCHAR(32),
  language VARCHAR(32),
  operational_status VARCHAR(32),
  audience_size INTEGER,
  joint_venture_id INTEGER,
  publication_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (joint_venture_id) REFERENCES joint_ventures (id),
  FOREIGN KEY (publication_id) REFERENCES publications (publication_id)
);
