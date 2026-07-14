CREATE TABLE n_h_s_foundation_trusts (
  id INTEGER NOT NULL,
  trust_identifier VARCHAR(32),
  trust_name VARCHAR(58),
  trust_type VARCHAR(32),
  founding_year INTEGER,
  current_quality_rating VARCHAR(32),
  nursing_leader_id INTEGER,
  quality_review_id INTEGER,
  nursing_workstream_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id),
  FOREIGN KEY (quality_review_id) REFERENCES quality_reviews (id),
  FOREIGN KEY (nursing_workstream_id) REFERENCES nursing_workstreams (id)
);
