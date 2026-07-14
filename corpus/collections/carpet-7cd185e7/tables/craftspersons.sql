CREATE TABLE craftspersons (
  id INTEGER NOT NULL,
  craftsperson_id VARCHAR(40),
  role VARCHAR(32),
  gender VARCHAR(32),
  region VARCHAR(32),
  years_of_experience INTEGER,
  affiliated_workshop VARCHAR(32),
  workshop_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (workshop_id) REFERENCES workshops (id)
);
