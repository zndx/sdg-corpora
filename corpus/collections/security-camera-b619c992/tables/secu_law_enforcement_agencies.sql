CREATE TABLE secu_law_enforcement_agencies (
  law_enforcement_agency_id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  agency_type VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  video_surveillance_data_id INTEGER,
  incident_id VARCHAR(32),
  PRIMARY KEY (law_enforcement_agency_id),
  FOREIGN KEY (video_surveillance_data_id) REFERENCES secu_video_surveillance_datas (id),
  FOREIGN KEY (incident_id) REFERENCES secu_security_incidents (incident_id)
);
