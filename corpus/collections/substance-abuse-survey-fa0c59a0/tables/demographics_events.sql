CREATE TABLE demographics_events (
  demographic_id VARCHAR(32) NOT NULL,
  referral_event_id INTEGER NOT NULL,
  PRIMARY KEY (demographic_id, referral_event_id),
  FOREIGN KEY (demographic_id) REFERENCES patient_demographics (demographic_id),
  FOREIGN KEY (referral_event_id) REFERENCES referral_events (id)
);
