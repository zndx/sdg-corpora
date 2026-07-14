CREATE TABLE owners (
  id INTEGER NOT NULL,
  owner_identifier VARCHAR(32),
  full_name VARCHAR(36),
  contact_email VARCHAR(32),
  experience_level VARCHAR(32),
  dog_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dog_id) REFERENCES dogs (dog_id)
);
