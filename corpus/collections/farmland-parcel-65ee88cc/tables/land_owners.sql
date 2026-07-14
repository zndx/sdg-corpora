CREATE TABLE land_owners (
  owner_id VARCHAR(32) NOT NULL,
  owner_name VARCHAR(32),
  owner_type VARCHAR(32),
  total_land_held DECIMAL,
  retirement_status VARCHAR(32),
  last_sale_price DECIMAL,
  institutional_investor_id INTEGER,
  PRIMARY KEY (owner_id),
  FOREIGN KEY (institutional_investor_id) REFERENCES institutional_investors (institutional_investor_id)
);
