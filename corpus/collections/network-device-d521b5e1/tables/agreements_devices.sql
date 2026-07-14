CREATE TABLE agreements_devices (
  service_level_agreement_id INTEGER NOT NULL,
  network_device_id INTEGER NOT NULL,
  PRIMARY KEY (service_level_agreement_id, network_device_id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (network_device_id)
);
