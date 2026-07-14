CREATE TABLE communication_channels (
  id INTEGER NOT NULL,
  channel_type VARCHAR(32),
  url VARCHAR(56),
  is_active BOOLEAN,
  PRIMARY KEY (id)
);
