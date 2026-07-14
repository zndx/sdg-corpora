CREATE TABLE solutions_devices (
  network_monitoring_solution_id INTEGER NOT NULL,
  medical_device_model_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (network_monitoring_solution_id, medical_device_model_number),
  FOREIGN KEY (network_monitoring_solution_id) REFERENCES network_monitoring_solutions (id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number)
);
