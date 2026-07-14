CREATE TABLE managers_campaigns (
  account_manager_id INTEGER NOT NULL,
  sales_campaign_id INTEGER NOT NULL,
  PRIMARY KEY (account_manager_id, sales_campaign_id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id),
  FOREIGN KEY (sales_campaign_id) REFERENCES sales_campaigns (id)
);
