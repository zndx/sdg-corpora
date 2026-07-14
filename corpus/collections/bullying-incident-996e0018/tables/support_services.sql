CREATE TABLE support_services (
  service_id VARCHAR(44) NOT NULL,
  service_type VARCHAR(32),
  provider_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  staff_member_id INTEGER,
  bullying_incident_id INTEGER,
  PRIMARY KEY (service_id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (id),
  FOREIGN KEY (bullying_incident_id) REFERENCES bullying_incidents (bullying_incident_id)
);
