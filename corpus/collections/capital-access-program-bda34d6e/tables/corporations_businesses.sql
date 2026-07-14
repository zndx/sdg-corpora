CREATE TABLE corporations_businesses (
  financial_development_corporation_id INTEGER NOT NULL,
  small_business_id INTEGER NOT NULL,
  PRIMARY KEY (financial_development_corporation_id, small_business_id),
  FOREIGN KEY (financial_development_corporation_id) REFERENCES financial_development_corporations (financial_development_corporation_id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id)
);
