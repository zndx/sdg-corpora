CREATE TABLE programs_devices (
  cybersecurity_program_id INTEGER NOT NULL,
  medical_device_model_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (cybersecurity_program_id, medical_device_model_number),
  FOREIGN KEY (cybersecurity_program_id) REFERENCES cybersecurity_programs (id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number)
);
