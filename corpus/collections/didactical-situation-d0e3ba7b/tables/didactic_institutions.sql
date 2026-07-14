CREATE TABLE didactic_institutions (
  didactic_institution_id INTEGER NOT NULL,
  institution_id INTEGER,
  name VARCHAR(32),
  jurisdiction VARCHAR(32),
  founding_year INTEGER,
  type VARCHAR(32),
  situation_id VARCHAR(35),
  PRIMARY KEY (didactic_institution_id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id)
);
