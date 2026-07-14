CREATE TABLE publications (
  publication_id INTEGER NOT NULL,
  title VARCHAR(32),
  language VARCHAR(32),
  frequency VARCHAR(32),
  status VARCHAR(32),
  circulation_count INTEGER,
  online_page_views DECIMAL,
  unique_visitors INTEGER,
  group_id VARCHAR(32),
  delivery_platform_id INTEGER,
  PRIMARY KEY (publication_id),
  FOREIGN KEY (group_id) REFERENCES media_groups (group_id),
  FOREIGN KEY (delivery_platform_id) REFERENCES delivery_platforms (id)
);
