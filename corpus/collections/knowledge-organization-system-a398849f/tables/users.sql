CREATE TABLE users (
  id INTEGER NOT NULL,
  user_id VARCHAR(44),
  username VARCHAR(32),
  registration_date DATE,
  role VARCHAR(32),
  affiliation VARCHAR(32),
  is_active BOOLEAN,
  resource_id INTEGER,
  social_tag_id INTEGER,
  tagging_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (resource_id) REFERENCES digital_resources (resource_id),
  FOREIGN KEY (social_tag_id) REFERENCES social_tags (id),
  FOREIGN KEY (tagging_activity_id) REFERENCES tagging_activities (id)
);
