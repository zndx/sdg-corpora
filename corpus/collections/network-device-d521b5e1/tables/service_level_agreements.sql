CREATE TABLE service_level_agreements (
  service_level_agreement_id INTEGER NOT NULL,
  sla_id INTEGER,
  provider_id VARCHAR(35),
  customer_class VARCHAR(32),
  max_bandwidth DECIMAL,
  latency_threshold DECIMAL,
  packet_loss_limit DECIMAL,
  effective_date DATE,
  expiration_date DATE,
  traffic_class_id INTEGER,
  resource_management_system_id INTEGER,
  PRIMARY KEY (service_level_agreement_id),
  FOREIGN KEY (traffic_class_id) REFERENCES traffic_classes (id),
  FOREIGN KEY (resource_management_system_id) REFERENCES resource_management_systems (resource_management_system_id)
);
