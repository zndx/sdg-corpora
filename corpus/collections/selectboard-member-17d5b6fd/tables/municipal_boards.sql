CREATE TABLE municipal_boards (
  id INTEGER NOT NULL,
  board_id VARCHAR(35),
  board_name VARCHAR(32),
  jurisdiction_name VARCHAR(32),
  meeting_schedule VARCHAR(32),
  official_newspaper VARCHAR(32),
  policy_id INTEGER,
  municipal_fund_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (policy_id) REFERENCES policies (id),
  FOREIGN KEY (municipal_fund_id) REFERENCES municipal_funds (municipal_fund_id)
);
