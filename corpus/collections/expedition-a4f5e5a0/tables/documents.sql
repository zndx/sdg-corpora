CREATE TABLE documents (
  id INTEGER NOT NULL,
  document_id VARCHAR(44),
  name VARCHAR(32),
  type VARCHAR(32),
  issue_date DATE,
  issuing_authority VARCHAR(32),
  recognized_by INTEGER,
  explorer_id INTEGER,
  action_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (explorer_id) REFERENCES explorers (explorer_id),
  FOREIGN KEY (action_id) REFERENCES humanitarian_actions (action_id)
);
