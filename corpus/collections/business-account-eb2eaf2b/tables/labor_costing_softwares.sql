CREATE TABLE labor_costing_softwares (
  id INTEGER NOT NULL,
  software_version VARCHAR(32),
  licensing_model VARCHAR(32),
  edi_enabled BOOLEAN,
  export_capabilities VARCHAR(32),
  standard_element_library_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (standard_element_library_id) REFERENCES standard_element_libraries (standard_element_library_id)
);
