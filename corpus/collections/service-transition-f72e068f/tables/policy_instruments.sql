CREATE TABLE policy_instruments (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  name VARCHAR(32),
  type VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  description VARCHAR(32),
  service_user_id INTEGER,
  health_care_setting_id INTEGER,
  service_transition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (health_care_setting_id) REFERENCES health_care_settings (id),
  FOREIGN KEY (service_transition_id) REFERENCES service_transitions (id)
);
