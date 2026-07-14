CREATE TABLE service_transitions (
  id INTEGER NOT NULL,
  transition_id VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  transition_type VARCHAR(32),
  status VARCHAR(32),
  description VARCHAR(32),
  service_user_id INTEGER,
  carer_id INTEGER,
  health_care_setting_id INTEGER,
  destined_for_health_care_setting_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (carer_id) REFERENCES carers (id),
  FOREIGN KEY (health_care_setting_id) REFERENCES health_care_settings (id),
  FOREIGN KEY (destined_for_health_care_setting_id) REFERENCES health_care_settings (id)
);
