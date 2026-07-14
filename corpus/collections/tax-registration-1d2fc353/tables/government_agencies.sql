CREATE TABLE government_agencies (
  id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  ministry VARCHAR(32),
  established_date DATE,
  government_mission_id INTEGER,
  training_centre_id INTEGER,
  registration_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (government_mission_id) REFERENCES government_missions (id),
  FOREIGN KEY (training_centre_id) REFERENCES training_centres (training_centre_id),
  FOREIGN KEY (registration_id) REFERENCES tax_registrations (registration_id)
);
