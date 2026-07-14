CREATE TABLE user_accounts (
  account_id VARCHAR(44) NOT NULL,
  username VARCHAR(32),
  last_password_change_date TIMESTAMP,
  password_expiry_days INTEGER,
  account_status VARCHAR(32),
  mac_book_pro_id INTEGER,
  PRIMARY KEY (account_id),
  FOREIGN KEY (mac_book_pro_id) REFERENCES mac_book_pros (mac_book_pro_id)
);
