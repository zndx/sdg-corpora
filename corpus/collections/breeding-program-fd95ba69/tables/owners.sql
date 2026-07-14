CREATE TABLE owners (
  owner_id INTEGER NOT NULL,
  owner_name VARCHAR(32),
  address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  phone VARCHAR(32),
  email VARCHAR(32),
  horse_id INTEGER,
  PRIMARY KEY (owner_id),
  FOREIGN KEY (horse_id) REFERENCES horses (id)
);
