CREATE TABLE sites_devices (
  clinical_site_id INTEGER NOT NULL,
  medical_device_model_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (clinical_site_id, medical_device_model_number),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (clinical_site_id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number)
);
