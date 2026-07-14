CREATE TABLE pricing_addons (
  addon_code VARCHAR(32) NOT NULL,
  addon_name VARCHAR(32),
  additional_cost DECIMAL,
  addon_type VARCHAR(32),
  item_code VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (addon_code),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code)
);
