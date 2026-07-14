CREATE TABLE statutory_amendments (
  statutory_amendment_id INTEGER NOT NULL,
  amendment_id INTEGER,
  target_section VARCHAR(32),
  target_clause VARCHAR(32),
  original_value VARCHAR(32),
  substituted_value VARCHAR(32),
  amendment_type VARCHAR(32),
  act_number VARCHAR(32),
  legislative_body_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (statutory_amendment_id),
  FOREIGN KEY (act_number) REFERENCES legislative_acts (act_number),
  FOREIGN KEY (legislative_body_id) REFERENCES legislative_bodies (id)
);
