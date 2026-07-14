CREATE TABLE pricing_tiers (
  id INTEGER NOT NULL,
  tier_code INTEGER,
  tier_label VARCHAR(32),
  price DECIMAL,
  portion_size VARCHAR(32),
  is_add_on BOOLEAN,
  item_code VARCHAR(32),
  addon_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code),
  FOREIGN KEY (addon_code) REFERENCES pricing_addons (addon_code)
);
