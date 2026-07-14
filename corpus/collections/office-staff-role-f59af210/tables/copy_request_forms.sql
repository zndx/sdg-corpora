CREATE TABLE copy_request_forms (
  id INTEGER NOT NULL,
  form_id VARCHAR(39),
  copyright_info VARCHAR(32),
  original_page_count INTEGER,
  copy_count INTEGER,
  is_properly_filled BOOLEAN,
  location_in_office VARCHAR(32),
  document_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (document_id) REFERENCES documents (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
