CREATE TABLE hardware_scanner_devices (
  id INTEGER NOT NULL,
  device_model_name VARCHAR(32),
  camera_resolution_megapixels INTEGER,
  maximum_scanning_size VARCHAR(32),
  power_source_type VARCHAR(32),
  interface_type VARCHAR(32),
  retail_price DECIMAL,
  currency_code VARCHAR(44),
  has_external_button BOOLEAN,
  has_barcode_scanner INTEGER,
  security_software_package_id INTEGER,
  official_identification_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (security_software_package_id) REFERENCES security_software_packages (id),
  FOREIGN KEY (official_identification_document_id) REFERENCES official_identification_documents (official_identification_document_id)
);
