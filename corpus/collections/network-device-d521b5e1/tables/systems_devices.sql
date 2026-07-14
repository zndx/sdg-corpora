CREATE TABLE systems_devices (
  resource_management_system_id INTEGER NOT NULL,
  network_device_id INTEGER NOT NULL,
  PRIMARY KEY (resource_management_system_id, network_device_id),
  FOREIGN KEY (resource_management_system_id) REFERENCES resource_management_systems (resource_management_system_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (network_device_id)
);
