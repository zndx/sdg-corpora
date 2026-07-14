CREATE TABLE service_users (
  id INTEGER NOT NULL,
  user_id VARCHAR(44),
  name VARCHAR(34),
  date_of_birth DATE,
  age_group VARCHAR(32),
  gender VARCHAR(32),
  primary_condition VARCHAR(32),
  health_care_setting_id INTEGER,
  carer_id INTEGER,
  service_transition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_care_setting_id) REFERENCES health_care_settings (id),
  FOREIGN KEY (carer_id) REFERENCES carers (id),
  FOREIGN KEY (service_transition_id) REFERENCES service_transitions (id)
);
