CREATE TABLE response_agencies (
  response_agency_id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  agency_type VARCHAR(32),
  contact_person VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  notification_method VARCHAR(32),
  spill_incident_id INTEGER,
  notified_of_spill_incident_id INTEGER,
  vessel_id INTEGER,
  PRIMARY KEY (response_agency_id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (notified_of_spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (vessel_id) REFERENCES vessels (id)
);
