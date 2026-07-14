CREATE TABLE third_party_vendors (
  vendor_id VARCHAR(32) NOT NULL,
  vendor_name VARCHAR(36),
  service_type VARCHAR(32),
  data_access_level VARCHAR(32),
  contract_start_date DATE,
  personal_data_record_id INTEGER,
  purchase_transaction_id INTEGER,
  PRIMARY KEY (vendor_id),
  FOREIGN KEY (personal_data_record_id) REFERENCES personal_data_records (id),
  FOREIGN KEY (purchase_transaction_id) REFERENCES purchase_transactions (id)
);
