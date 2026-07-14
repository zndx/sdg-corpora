CREATE TABLE quality_reviews (
  id INTEGER NOT NULL,
  review_identifier VARCHAR(32),
  review_type VARCHAR(32),
  review_date DATE,
  review_outcome VARCHAR(32),
  key_findings VARCHAR(32),
  n_h_s_foundation_trust_id INTEGER,
  nursing_leader_id INTEGER,
  nursing_workstream_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (n_h_s_foundation_trust_id) REFERENCES n_h_s_foundation_trusts (id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id),
  FOREIGN KEY (nursing_workstream_id) REFERENCES nursing_workstreams (id)
);
