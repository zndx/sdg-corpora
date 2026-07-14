CREATE TABLE subsidiaries (
  subsidiary_id INTEGER NOT NULL,
  subsidiary_name VARCHAR(32),
  ownership_percentage DECIMAL,
  business_type VARCHAR(32),
  operational_status VARCHAR(32),
  location VARCHAR(32),
  group_id VARCHAR(32),
  delivery_platform_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (subsidiary_id),
  FOREIGN KEY (group_id) REFERENCES media_groups (group_id),
  FOREIGN KEY (delivery_platform_id) REFERENCES delivery_platforms (id)
);
