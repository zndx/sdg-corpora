CREATE TABLE requests_cards (
  order_request_id INTEGER NOT NULL,
  occasion_card_id INTEGER NOT NULL,
  PRIMARY KEY (order_request_id, occasion_card_id),
  FOREIGN KEY (order_request_id) REFERENCES order_requests (id),
  FOREIGN KEY (occasion_card_id) REFERENCES occasion_cards (occasion_card_id)
);
