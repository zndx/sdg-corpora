CREATE TABLE customer_accounts (
  id INTEGER NOT NULL,
  customer_i_d VARCHAR(32),
  company_name VARCHAR(32),
  contact_email VARCHAR(32),
  credit_limit DECIMAL,
  account_status VARCHAR(32),
  registration_date DATE,
  shipment_record_id INTEGER,
  marketing_campaign_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (shipment_record_id) REFERENCES shipment_records (shipment_record_id),
  FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaigns (marketing_campaign_id)
);
