CREATE TABLE traffic_classes (
  id INTEGER NOT NULL,
  traffic_class_id VARCHAR(44),
  dscp_code INTEGER,
  priority_level INTEGER,
  bandwidth_allocation DECIMAL,
  max_latency DECIMAL,
  jitter_tolerance DECIMAL,
  network_device_id INTEGER,
  service_level_agreement_id INTEGER,
  call_admission_control_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (network_device_id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (call_admission_control_id) REFERENCES call_admission_controls (call_admission_control_id)
);
