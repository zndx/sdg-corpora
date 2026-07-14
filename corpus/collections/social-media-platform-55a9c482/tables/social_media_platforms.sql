CREATE TABLE social_media_platforms (
  id INTEGER NOT NULL,
  platform_identifier VARCHAR(32),
  platform_name VARCHAR(32),
  primary_function VARCHAR(32),
  adoption_status VARCHAR(32),
  usage_frequency VARCHAR(32),
  is_enterprise_grade BOOLEAN,
  PRIMARY KEY (id)
);
