CREATE TABLE secu_security_incidents (
  incident_id VARCHAR(32) NOT NULL,
  incident_date_time TIMESTAMP,
  incident_type VARCHAR(32),
  severity_level VARCHAR(32),
  status VARCHAR(32),
  reported_by VARCHAR(32),
  library_property_id INTEGER,
  video_surveillance_data_id INTEGER,
  staff_member_id INTEGER,
  law_enforcement_agency_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (incident_id),
  FOREIGN KEY (library_property_id) REFERENCES secu_library_properties (library_property_id),
  FOREIGN KEY (video_surveillance_data_id) REFERENCES secu_video_surveillance_datas (id),
  FOREIGN KEY (staff_member_id) REFERENCES secu_staff_members (staff_member_id),
  FOREIGN KEY (law_enforcement_agency_id) REFERENCES secu_law_enforcement_agencies (law_enforcement_agency_id)
);
