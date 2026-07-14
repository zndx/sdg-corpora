CREATE TABLE purchase_transactions (
  id INTEGER NOT NULL,
  transaction_id INTEGER,
  transaction_date TIMESTAMP,
  total_amount VARCHAR(32),
  payment_method VARCHAR(32),
  store_location VARCHAR(32),
  items_purchased VARCHAR(32),
  customer_profile_id INTEGER,
  vendor_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (customer_profile_id) REFERENCES customer_profiles (id),
  FOREIGN KEY (vendor_id) REFERENCES third_party_vendors (vendor_id)
);
