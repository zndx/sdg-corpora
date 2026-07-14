CREATE TABLE governance_boards (
  board_id VARCHAR(35) NOT NULL,
  board_name VARCHAR(32),
  organization_id VARCHAR(40),
  established_date DATE,
  status VARCHAR(32),
  oversees_organization_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (board_id),
  FOREIGN KEY (oversees_organization_id) REFERENCES organizations (id)
);
