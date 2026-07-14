CREATE TABLE postal_addresses (
  id INTEGER NOT NULL,
  building_code INTEGER,
  room_number VARCHAR(32),
  street_address VARCHAR(32),
  is_mail_pickup_location BOOLEAN,
  mail_sort_deadline TIMESTAMP,
  document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (document_id) REFERENCES documents (id)
);
