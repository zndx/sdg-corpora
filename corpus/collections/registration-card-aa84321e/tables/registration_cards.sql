CREATE TABLE registration_cards (
  card_id VARCHAR(35) NOT NULL,
  card_type VARCHAR(32),
  issue_date DATE,
  expiry_date DATE,
  holder_name VARCHAR(32),
  trade_category VARCHAR(32),
  vat_excluded_price VARCHAR(32),
  PRIMARY KEY (card_id)
);
