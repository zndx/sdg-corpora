CREATE TABLE joint_ventures (
  id INTEGER NOT NULL,
  venture_id INTEGER,
  venture_name VARCHAR(32),
  ownership_structure VARCHAR(32),
  business_type VARCHAR(32),
  operational_status VARCHAR(32),
  location VARCHAR(32),
  group_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (group_id) REFERENCES media_groups (group_id)
);
