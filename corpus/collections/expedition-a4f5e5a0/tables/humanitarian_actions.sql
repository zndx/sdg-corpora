CREATE TABLE humanitarian_actions (
  action_id INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  type VARCHAR(32),
  beneficiaries_count INTEGER,
  status VARCHAR(32),
  explorer_id INTEGER,
  document_id INTEGER,
  PRIMARY KEY (action_id),
  FOREIGN KEY (explorer_id) REFERENCES explorers (explorer_id),
  FOREIGN KEY (document_id) REFERENCES documents (id)
);
