CREATE TABLE shipment_records (
  shipment_record_id INTEGER NOT NULL,
  tracking_number VARCHAR(32),
  shipment_date TIMESTAMP,
  carrier_name VARCHAR(32),
  total_weight DECIMAL,
  shipping_method VARCHAR(32),
  status VARCHAR(32),
  customer_account_id INTEGER,
  PRIMARY KEY (shipment_record_id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
