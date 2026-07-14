CREATE TABLE secu_staff_members (
  staff_member_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  access_level VARCHAR(32),
  hire_date DATE,
  video_surveillance_data_id INTEGER,
  incident_id VARCHAR(32),
  reports_to_staff_member_id INTEGER,
  PRIMARY KEY (staff_member_id),
  FOREIGN KEY (video_surveillance_data_id) REFERENCES secu_video_surveillance_datas (id),
  FOREIGN KEY (incident_id) REFERENCES secu_security_incidents (incident_id),
  FOREIGN KEY (reports_to_staff_member_id) REFERENCES secu_staff_members (staff_member_id)
);
