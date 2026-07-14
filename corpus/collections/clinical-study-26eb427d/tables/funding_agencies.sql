CREATE TABLE funding_agencies (
  id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  website VARCHAR(56),
  funding_award_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (funding_award_id) REFERENCES funding_awards (funding_award_id)
);
