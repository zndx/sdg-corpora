CREATE TABLE logos_orders (
  corporate_logo_id INTEGER NOT NULL,
  calendar_order_id INTEGER NOT NULL,
  PRIMARY KEY (corporate_logo_id, calendar_order_id),
  FOREIGN KEY (corporate_logo_id) REFERENCES corporate_logos (id),
  FOREIGN KEY (calendar_order_id) REFERENCES calendar_orders (calendar_order_id)
);
