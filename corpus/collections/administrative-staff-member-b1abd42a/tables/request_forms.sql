CREATE TABLE request_forms (
  form_id VARCHAR(39) NOT NULL,
  form_type VARCHAR(32),
  is_complete BOOLEAN,
  copyright_info_provided BOOLEAN,
  location_in_office VARCHAR(32),
  office_service_request_id INTEGER,
  PRIMARY KEY (form_id),
  FOREIGN KEY (office_service_request_id) REFERENCES office_service_requests (id)
);
