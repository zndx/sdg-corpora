CREATE TABLE law_enforcement_appointments (
  id INTEGER NOT NULL,
  appointment_id VARCHAR(35),
  start_date DATE,
  end_date DATE,
  title VARCHAR(32),
  agency_name VARCHAR(37),
  jurisdiction VARCHAR(32),
  law_enforcement_agency_id INTEGER,
  person_id INTEGER,
  law_enforcement_division_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (law_enforcement_agency_id) REFERENCES law_enforcement_agencies (law_enforcement_agency_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (law_enforcement_division_id) REFERENCES law_enforcement_divisions (id)
);
