CREATE TABLE periods_prescriptions (
  transition_period_id INTEGER NOT NULL,
  prescription_id INTEGER NOT NULL,
  PRIMARY KEY (transition_period_id, prescription_id),
  FOREIGN KEY (transition_period_id) REFERENCES transition_periods (transition_period_id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (id)
);
