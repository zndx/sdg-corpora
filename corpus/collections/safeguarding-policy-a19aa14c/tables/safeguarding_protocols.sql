CREATE TABLE safeguarding_protocols (
  protocol_id INTEGER NOT NULL,
  protocol_name VARCHAR(32),
  trigger_condition VARCHAR(32),
  required_action VARCHAR(32),
  deadline_hours INTEGER,
  status VARCHAR(32),
  incident_id INTEGER,
  referral_id INTEGER,
  PRIMARY KEY (protocol_id),
  FOREIGN KEY (incident_id) REFERENCES incidents (id),
  FOREIGN KEY (referral_id) REFERENCES referrals (referral_id)
);
