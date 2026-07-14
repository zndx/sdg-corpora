CREATE TABLE digital_platforms (
  id INTEGER NOT NULL,
  platform_id VARCHAR(44),
  platform_name VARCHAR(32),
  platform_type VARCHAR(32),
  url VARCHAR(56),
  cookie_enabled BOOLEAN,
  analytics_provider VARCHAR(32),
  tracking_software_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (tracking_software_id) REFERENCES tracking_softwares (id)
);
