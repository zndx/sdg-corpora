CREATE TABLE remuneration_events (
  remuneration_event_id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_date TIMESTAMP,
  amount DECIMAL,
  fee_type VARCHAR(32),
  currency VARCHAR(32),
  authorised_representative_id INTEGER,
  investor_id INTEGER,
  PRIMARY KEY (remuneration_event_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id),
  FOREIGN KEY (investor_id) REFERENCES investors (id)
);
