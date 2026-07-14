CREATE TABLE county_jurisdictions (
  county_jurisdiction_id INTEGER NOT NULL,
  jurisdiction_id VARCHAR(34),
  jurisdiction_name VARCHAR(32),
  state_code INTEGER,
  legislative_body VARCHAR(32),
  board_of_trustees_id INTEGER,
  county_executive_id INTEGER,
  public_institution_id INTEGER,
  PRIMARY KEY (county_jurisdiction_id),
  FOREIGN KEY (board_of_trustees_id) REFERENCES board_of_trusteeses (id),
  FOREIGN KEY (county_executive_id) REFERENCES county_executives (id),
  FOREIGN KEY (public_institution_id) REFERENCES public_institutions (id)
);
