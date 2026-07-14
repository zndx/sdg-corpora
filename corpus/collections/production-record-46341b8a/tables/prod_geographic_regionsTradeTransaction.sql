CREATE TABLE prod_geographic_regionsTradeTransaction (
  geographic_region_id INTEGER NOT NULL,
  trade_transaction_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, trade_transaction_id),
  FOREIGN KEY (geographic_region_id) REFERENCES prod_geographic_regions (id),
  FOREIGN KEY (trade_transaction_id) REFERENCES prod_trade_transactions (id)
);
