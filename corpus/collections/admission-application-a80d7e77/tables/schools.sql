CREATE TABLE schools (
  school_id INTEGER NOT NULL,
  school_name VARCHAR(32),
  street_address VARCHAR(32),
  post_code INTEGER,
  telephone VARCHAR(32),
  website VARCHAR(56),
  child_id INTEGER,
  address_id VARCHAR(44),
  PRIMARY KEY (school_id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (address_id) REFERENCES addresses (address_id)
);
