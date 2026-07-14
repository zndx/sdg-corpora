CREATE TABLE contact_informations (
  contact_information_id INTEGER NOT NULL,
  contact_person VARCHAR(32),
  street_address VARCHAR(32),
  cell_phone VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  alternate_phone VARCHAR(32),
  email VARCHAR(32),
  PRIMARY KEY (contact_information_id)
);
