CREATE TABLE platforms_individuals (
  social_media_platform_id INTEGER NOT NULL,
  individual_id INTEGER NOT NULL,
  PRIMARY KEY (social_media_platform_id, individual_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (social_media_platform_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
