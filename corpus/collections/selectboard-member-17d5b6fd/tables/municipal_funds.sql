CREATE TABLE municipal_funds (
  municipal_fund_id INTEGER NOT NULL,
  fund_id VARCHAR(32),
  fund_name VARCHAR(32),
  fiscal_year VARCHAR(32),
  total_allocation DECIMAL,
  current_balance VARCHAR(32),
  spending_threshold DECIMAL,
  municipal_board_id INTEGER,
  project_id INTEGER,
  business_entity_business_id VARCHAR(40),
  PRIMARY KEY (municipal_fund_id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (business_entity_business_id) REFERENCES business_entities (business_id)
);
