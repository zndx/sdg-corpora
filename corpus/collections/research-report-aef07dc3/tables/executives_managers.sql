CREATE TABLE executives_managers (
  executive_id INTEGER NOT NULL,
  account_manager_id INTEGER NOT NULL,
  PRIMARY KEY (executive_id, account_manager_id),
  FOREIGN KEY (executive_id) REFERENCES executives (id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id)
);
