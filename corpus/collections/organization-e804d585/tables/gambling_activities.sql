CREATE TABLE gambling_activities (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_name VARCHAR(32),
  is_consideration_required BOOLEAN,
  legal_status VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  organization_id INTEGER,
  gambling_fund_id INTEGER,
  regulatory_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (gambling_fund_id) REFERENCES gambling_funds (id),
  FOREIGN KEY (regulatory_statute_id) REFERENCES regulatory_statutes (regulatory_statute_id)
);
