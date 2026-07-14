CREATE TABLE archive_locations (
  id INTEGER NOT NULL,
  location_identifier VARCHAR(32),
  location_name VARCHAR(32),
  city VARCHAR(32),
  country VARCHAR(32),
  access_policy VARCHAR(32),
  document_id INTEGER,
  archive_location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (document_id) REFERENCES documents (document_id),
  FOREIGN KEY (archive_location_id) REFERENCES archive_locations (id)
);
