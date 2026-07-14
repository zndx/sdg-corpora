CREATE TABLE learned_societies (
  learned_society_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  founding_year INTEGER,
  status VARCHAR(32),
  funding_model VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  PRIMARY KEY (learned_society_id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code)
);
