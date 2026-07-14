CREATE TABLE standard_element_libraries (
  standard_element_library_id INTEGER NOT NULL,
  library_version VARCHAR(32),
  content_status VARCHAR(32),
  last_updated TIMESTAMP,
  platform_company_id INTEGER,
  PRIMARY KEY (standard_element_library_id),
  FOREIGN KEY (platform_company_id) REFERENCES platform_companies (id)
);
