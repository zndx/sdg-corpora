CREATE TABLE catering_orders (
  catering_order_id INTEGER NOT NULL,
  order_id VARCHAR(32),
  order_date TIMESTAMP,
  delivery_date DATE,
  order_status VARCHAR(32),
  total_amount VARCHAR(32),
  contact_phone VARCHAR(32),
  PRIMARY KEY (catering_order_id)
);
