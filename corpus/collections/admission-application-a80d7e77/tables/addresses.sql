CREATE TABLE addresses (
  address_id VARCHAR(44) NOT NULL,
  street VARCHAR(32),
  city VARCHAR(32),
  county VARCHAR(32),
  post_code INTEGER,
  address_type VARCHAR(32),
  guardian_id INTEGER,
  child_id INTEGER,
  PRIMARY KEY (address_id),
  FOREIGN KEY (guardian_id) REFERENCES guardians (guardian_id),
  FOREIGN KEY (child_id) REFERENCES childs (id)
);
