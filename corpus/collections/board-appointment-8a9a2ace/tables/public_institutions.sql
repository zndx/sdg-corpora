CREATE TABLE public_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  institution_name VARCHAR(32),
  institution_type VARCHAR(32),
  location_address VARCHAR(32),
  operational_status VARCHAR(32),
  board_of_trustees_id INTEGER,
  county_jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (board_of_trustees_id) REFERENCES board_of_trusteeses (id),
  FOREIGN KEY (county_jurisdiction_id) REFERENCES county_jurisdictions (county_jurisdiction_id)
);
