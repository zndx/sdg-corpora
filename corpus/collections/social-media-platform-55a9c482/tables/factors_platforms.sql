CREATE TABLE factors_platforms (
  communication_factor_id INTEGER NOT NULL,
  social_media_platform_id INTEGER NOT NULL,
  PRIMARY KEY (communication_factor_id, social_media_platform_id),
  FOREIGN KEY (communication_factor_id) REFERENCES communication_factors (id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id)
);
