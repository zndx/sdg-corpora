CREATE TABLE systems_controls (
  resource_management_system_id INTEGER NOT NULL,
  call_admission_control_id INTEGER NOT NULL,
  PRIMARY KEY (resource_management_system_id, call_admission_control_id),
  FOREIGN KEY (resource_management_system_id) REFERENCES resource_management_systems (resource_management_system_id),
  FOREIGN KEY (call_admission_control_id) REFERENCES call_admission_controls (call_admission_control_id)
);
