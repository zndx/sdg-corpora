CREATE TABLE media_groups (
  group_id VARCHAR(32) NOT NULL,
  group_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  founding_year INTEGER,
  market_share DECIMAL,
  total_audience INTEGER,
  total_page_views DECIMAL,
  total_unique_visitors INTEGER,
  subsidiary_id INTEGER,
  delivery_platform_id INTEGER,
  PRIMARY KEY (group_id),
  FOREIGN KEY (subsidiary_id) REFERENCES subsidiaries (subsidiary_id),
  FOREIGN KEY (delivery_platform_id) REFERENCES delivery_platforms (id)
);
