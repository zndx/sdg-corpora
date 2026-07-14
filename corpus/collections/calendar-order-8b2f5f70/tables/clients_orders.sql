CREATE TABLE clients_orders (
  business_client_id INTEGER NOT NULL,
  calendar_order_id INTEGER NOT NULL,
  PRIMARY KEY (business_client_id, calendar_order_id),
  FOREIGN KEY (business_client_id) REFERENCES business_clients (id),
  FOREIGN KEY (calendar_order_id) REFERENCES calendar_orders (calendar_order_id)
);
