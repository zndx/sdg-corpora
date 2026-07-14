CREATE TABLE engineers_services (
  technical_support_engineer_id INTEGER NOT NULL,
  service_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (technical_support_engineer_id, service_id),
  FOREIGN KEY (technical_support_engineer_id) REFERENCES technical_support_engineers (technical_support_engineer_id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id)
);
