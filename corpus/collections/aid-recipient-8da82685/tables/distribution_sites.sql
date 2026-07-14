CREATE TABLE distribution_sites (
  id INTEGER NOT NULL,
  site_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  postal_code VARCHAR(35),
  aid_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (aid_program_id) REFERENCES aid_programs (id)
);
