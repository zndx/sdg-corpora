CREATE TABLE divine_fathers (
  divine_father_id INTEGER NOT NULL,
  father_id VARCHAR(44),
  divine_name VARCHAR(32),
  relationship_type VARCHAR(32),
  covenant_status VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (divine_father_id)
);
