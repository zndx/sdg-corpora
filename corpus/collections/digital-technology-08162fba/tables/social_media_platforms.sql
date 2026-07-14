CREATE TABLE social_media_platforms (
  social_media_platform_id INTEGER NOT NULL,
  platform_name VARCHAR(32),
  platform_u_r_l VARCHAR(32),
  data_collection_policy VARCHAR(32),
  is_external BOOLEAN,
  digital_technology_id INTEGER,
  PRIMARY KEY (social_media_platform_id),
  FOREIGN KEY (digital_technology_id) REFERENCES digital_technologies (id)
);
