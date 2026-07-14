CREATE TABLE services_users (
  service_code VARCHAR(32) NOT NULL,
  service_user_id INTEGER NOT NULL,
  PRIMARY KEY (service_code, service_user_id),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id)
);
