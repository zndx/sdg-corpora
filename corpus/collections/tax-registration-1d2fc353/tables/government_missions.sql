CREATE TABLE government_missions (
  id INTEGER NOT NULL,
  mission_id VARCHAR(44),
  mission_name VARCHAR(32),
  launch_date DATE,
  anniversary_year INTEGER,
  objective VARCHAR(32),
  government_agency_id INTEGER,
  training_centre_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (id),
  FOREIGN KEY (training_centre_id) REFERENCES training_centres (training_centre_id)
);
