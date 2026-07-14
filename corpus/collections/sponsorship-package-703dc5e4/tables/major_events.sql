CREATE TABLE major_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  venue_name VARCHAR(32),
  venue_address VARCHAR(32),
  event_type VARCHAR(32),
  annual_edition INTEGER,
  theme VARCHAR(32),
  award_recipient_id INTEGER,
  networking_session_id INTEGER,
  silent_auction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (award_recipient_id) REFERENCES award_recipients (id),
  FOREIGN KEY (networking_session_id) REFERENCES networking_sessions (id),
  FOREIGN KEY (silent_auction_id) REFERENCES silent_auctions (silent_auction_id)
);
