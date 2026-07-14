CREATE TABLE ethical_protocols (
  id INTEGER NOT NULL,
  protocol_id INTEGER,
  protocol_name VARCHAR(32),
  approval_date TIMESTAMP,
  reviewing_body VARCHAR(32),
  principles VARCHAR(32),
  status VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
