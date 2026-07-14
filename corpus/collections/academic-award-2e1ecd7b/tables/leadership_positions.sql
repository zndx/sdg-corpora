CREATE TABLE leadership_positions (
  id INTEGER NOT NULL,
  position_identifier VARCHAR(32),
  position_title VARCHAR(32),
  organization_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  position_status VARCHAR(32),
  researcher_id INTEGER,
  professional_society_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (professional_society_id) REFERENCES professional_societies (professional_society_id)
);
