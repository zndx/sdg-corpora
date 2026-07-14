CREATE TABLE campaigns_accounts (
  marketing_campaign_id INTEGER NOT NULL,
  customer_account_id INTEGER NOT NULL,
  PRIMARY KEY (marketing_campaign_id, customer_account_id),
  FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaigns (marketing_campaign_id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
