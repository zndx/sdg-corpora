CREATE TABLE investors (
  id INTEGER NOT NULL,
  investor_id VARCHAR(32),
  investor_name VARCHAR(32),
  registration_date TIMESTAMP,
  account_status VARCHAR(32),
  total_investment DECIMAL,
  authorised_representative_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id)
);
