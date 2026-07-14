CREATE TABLE database_records (
  database_record_id INTEGER NOT NULL,
  record_i_d VARCHAR(32),
  table_name VARCHAR(32),
  last_modified TIMESTAMP,
  modified_by VARCHAR(32),
  record_hash VARCHAR(32),
  is_duplicate BOOLEAN,
  inventory_item_id INTEGER,
  customer_account_id INTEGER,
  PRIMARY KEY (database_record_id),
  FOREIGN KEY (inventory_item_id) REFERENCES inventory_items (id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
