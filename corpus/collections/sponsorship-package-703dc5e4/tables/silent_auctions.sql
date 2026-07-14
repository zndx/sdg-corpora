CREATE TABLE silent_auctions (
  silent_auction_id INTEGER NOT NULL,
  auction_id VARCHAR(35),
  auction_date TIMESTAMP,
  total_proceeds DECIMAL,
  number_of_items INTEGER,
  status VARCHAR(32),
  major_event_id INTEGER,
  PRIMARY KEY (silent_auction_id),
  FOREIGN KEY (major_event_id) REFERENCES major_events (id)
);
