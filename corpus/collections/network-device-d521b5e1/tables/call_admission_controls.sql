CREATE TABLE call_admission_controls (
  call_admission_control_id INTEGER NOT NULL,
  cac_id INTEGER,
  algorithm_type VARCHAR(32),
  current_load DECIMAL,
  threshold_utilization DECIMAL,
  decision_status VARCHAR(32),
  timestamp TIMESTAMP,
  traffic_class_id INTEGER,
  service_level_agreement_id INTEGER,
  resource_management_system_id INTEGER,
  PRIMARY KEY (call_admission_control_id),
  FOREIGN KEY (traffic_class_id) REFERENCES traffic_classes (id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (resource_management_system_id) REFERENCES resource_management_systems (resource_management_system_id)
);
