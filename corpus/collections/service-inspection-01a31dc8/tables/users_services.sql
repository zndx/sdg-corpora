CREATE TABLE users_services (
  service_user_id INTEGER NOT NULL,
  service_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (service_user_id, service_code),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code)
);
