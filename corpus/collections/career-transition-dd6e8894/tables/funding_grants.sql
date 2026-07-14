CREATE TABLE funding_grants (
  funding_grant_id INTEGER NOT NULL,
  grant_id VARCHAR(44),
  funder_name VARCHAR(32),
  amount DECIMAL,
  award_date DATE,
  purpose VARCHAR(32),
  PRIMARY KEY (funding_grant_id)
);
