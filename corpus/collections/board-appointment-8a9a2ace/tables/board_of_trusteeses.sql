CREATE TABLE board_of_trusteeses (
  id INTEGER NOT NULL,
  board_id VARCHAR(35),
  board_name VARCHAR(32),
  establishment_date DATE,
  governing_statute VARCHAR(32),
  jurisdiction VARCHAR(32),
  public_institution_id INTEGER,
  county_jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (public_institution_id) REFERENCES public_institutions (id),
  FOREIGN KEY (county_jurisdiction_id) REFERENCES county_jurisdictions (county_jurisdiction_id)
);
