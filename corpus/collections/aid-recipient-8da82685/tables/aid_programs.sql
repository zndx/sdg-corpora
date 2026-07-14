CREATE TABLE aid_programs (
  id INTEGER NOT NULL,
  program_name VARCHAR(32),
  season VARCHAR(32),
  supporting_organization VARCHAR(45),
  registration_deadline DATE,
  pickup_date DATE,
  pickup_start_time TIMESTAMP,
  pickup_end_time TIMESTAMP,
  distribution_site_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (distribution_site_id) REFERENCES distribution_sites (id)
);
