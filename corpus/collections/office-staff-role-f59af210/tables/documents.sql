CREATE TABLE documents (
  id INTEGER NOT NULL,
  document_type VARCHAR(32),
  creation_date DATE,
  is_copyrighted BOOLEAN,
  has_original_pages INTEGER,
  has_copy_count INTEGER,
  is_emergency BOOLEAN,
  drop_box_location VARCHAR(32),
  person_id INTEGER,
  office_process_id INTEGER,
  copy_request_form_id INTEGER,
  postal_address_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (office_process_id) REFERENCES office_processes (id),
  FOREIGN KEY (copy_request_form_id) REFERENCES copy_request_forms (id),
  FOREIGN KEY (postal_address_id) REFERENCES postal_addresses (id)
);
