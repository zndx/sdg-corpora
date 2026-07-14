CREATE TABLE delivery_platforms (
  id INTEGER NOT NULL,
  platform_id VARCHAR(44),
  platform_name VARCHAR(32),
  platform_type VARCHAR(32),
  access_method VARCHAR(32),
  active_status BOOLEAN,
  monthly_visitors INTEGER,
  monthly_page_views DECIMAL,
  publication_id INTEGER,
  group_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (publication_id) REFERENCES publications (publication_id),
  FOREIGN KEY (group_id) REFERENCES media_groups (group_id)
);
