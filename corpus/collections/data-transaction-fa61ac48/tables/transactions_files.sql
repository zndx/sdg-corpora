CREATE TABLE transactions_files (
  data_transaction_id INTEGER NOT NULL,
  data_file_id INTEGER NOT NULL,
  PRIMARY KEY (data_transaction_id, data_file_id),
  FOREIGN KEY (data_transaction_id) REFERENCES data_transactions (data_transaction_id),
  FOREIGN KEY (data_file_id) REFERENCES data_files (data_file_id)
);
