CREATE TABLE health_care_settings (
  id INTEGER NOT NULL,
  setting_id VARCHAR(32),
  name VARCHAR(32),
  type VARCHAR(32),
  location VARCHAR(32),
  contact_info VARCHAR(32),
  service_user_id INTEGER,
  service_transition_id INTEGER,
  destined_for_transition_service_transition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (service_transition_id) REFERENCES service_transitions (id),
  FOREIGN KEY (destined_for_transition_service_transition_id) REFERENCES service_transitions (id)
);
