CREATE TABLE resources_tags (
  resource_id INTEGER NOT NULL,
  social_tag_id INTEGER NOT NULL,
  PRIMARY KEY (resource_id, social_tag_id),
  FOREIGN KEY (resource_id) REFERENCES digital_resources (resource_id),
  FOREIGN KEY (social_tag_id) REFERENCES social_tags (id)
);
