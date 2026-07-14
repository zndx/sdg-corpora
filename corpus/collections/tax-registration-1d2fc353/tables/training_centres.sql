CREATE TABLE training_centres (
  training_centre_id INTEGER NOT NULL,
  centre_id VARCHAR(32),
  centre_name VARCHAR(32),
  centre_type VARCHAR(37),
  inauguration_date DATE,
  location VARCHAR(32),
  capacity INTEGER,
  government_agency_id INTEGER,
  government_mission_id INTEGER,
  PRIMARY KEY (training_centre_id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (id),
  FOREIGN KEY (government_mission_id) REFERENCES government_missions (id)
);
