CREATE TABLE joint_ownerships (
  joint_ownership_id INTEGER NOT NULL,
  ownership_id VARCHAR(44),
  asset_type VARCHAR(32),
  survivorship_right BOOLEAN,
  registration_date DATE,
  jurisdiction VARCHAR(32),
  ownership_percentage DECIMAL,
  investment_fund_account_id INTEGER,
  PRIMARY KEY (joint_ownership_id),
  FOREIGN KEY (investment_fund_account_id) REFERENCES investment_fund_accounts (id)
);
