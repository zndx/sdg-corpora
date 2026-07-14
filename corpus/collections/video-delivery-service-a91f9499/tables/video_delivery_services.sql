CREATE TABLE video_delivery_services (
  service_id VARCHAR(44) NOT NULL,
  service_tier VARCHAR(32),
  uptime_percentage DECIMAL,
  supported_platforms VARCHAR(32),
  region VARCHAR(32),
  status VARCHAR(32),
  PRIMARY KEY (service_id)
);
