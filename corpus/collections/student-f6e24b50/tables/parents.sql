CREATE TABLE parents (
  id INTEGER NOT NULL,
  given_name VARCHAR(32),
  chinese_name VARCHAR(32),
  home_phone VARCHAR(32),
  cell_phone VARCHAR(32),
  email VARCHAR(32),
  home_address VARCHAR(32),
  city VARCHAR(32),
  zip_code VARCHAR(44),
  emergency_contact_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (emergency_contact_id) REFERENCES emergency_contacts (id)
);
