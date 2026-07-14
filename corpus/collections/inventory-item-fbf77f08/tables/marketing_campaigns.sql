CREATE TABLE marketing_campaigns (
  marketing_campaign_id INTEGER NOT NULL,
  campaign_i_d VARCHAR(32),
  campaign_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  budget DECIMAL,
  channel VARCHAR(32),
  status VARCHAR(32),
  inventory_item_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (marketing_campaign_id),
  FOREIGN KEY (inventory_item_id) REFERENCES inventory_items (id)
);
