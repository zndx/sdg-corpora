CREATE TABLE nursing_leaders (
  nursing_leader_id INTEGER NOT NULL,
  leader_identifier VARCHAR(32),
  full_legal_name VARCHAR(32),
  professional_qualifications VARCHAR(32),
  current_title VARCHAR(32),
  appointment_date TIMESTAMP,
  years_of_experience INTEGER,
  nursing_workstream_id INTEGER,
  n_h_s_foundation_trust_id INTEGER,
  previously_held_role_at_n_h_s_foundation_trust_id INTEGER,
  PRIMARY KEY (nursing_leader_id),
  FOREIGN KEY (nursing_workstream_id) REFERENCES nursing_workstreams (id),
  FOREIGN KEY (n_h_s_foundation_trust_id) REFERENCES n_h_s_foundation_trusts (id),
  FOREIGN KEY (previously_held_role_at_n_h_s_foundation_trust_id) REFERENCES n_h_s_foundation_trusts (id)
);
