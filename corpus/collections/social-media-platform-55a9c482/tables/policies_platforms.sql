CREATE TABLE policies_platforms (
  organizational_policy_id INTEGER NOT NULL,
  social_media_platform_id INTEGER NOT NULL,
  PRIMARY KEY (organizational_policy_id, social_media_platform_id),
  FOREIGN KEY (organizational_policy_id) REFERENCES organizational_policies (id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id)
);
