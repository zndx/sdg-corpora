CREATE TABLE prod_trade_transactions (
  id INTEGER NOT NULL,
  transaction_id INTEGER,
  volume DECIMAL,
  unit VARCHAR(32),
  date TIMESTAMP,
  direction VARCHAR(32),
  status VARCHAR(32),
  geographic_region_id INTEGER,
  involves_importer_geographic_region_id INTEGER,
  commodity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES prod_geographic_regions (id),
  FOREIGN KEY (involves_importer_geographic_region_id) REFERENCES prod_geographic_regions (id),
  FOREIGN KEY (commodity_id) REFERENCES prod_commodities (commodity_id)
);
