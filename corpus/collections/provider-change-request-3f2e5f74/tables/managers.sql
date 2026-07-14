CREATE TABLE managers (
  id INTEGER NOT NULL,
  manager_id VARCHAR(44),
  printed_name VARCHAR(32),
  signature VARCHAR(32),
  review_date TIMESTAMP,
  decision_text VARCHAR(32),
  notification_date TIMESTAMP,
  provider_change_request_id INTEGER,
  clinic_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (provider_change_request_id) REFERENCES provider_change_requests (provider_change_request_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);
