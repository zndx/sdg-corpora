CREATE TABLE orders_lines (
  catering_order_id INTEGER NOT NULL,
  order_line_id INTEGER NOT NULL,
  PRIMARY KEY (catering_order_id, order_line_id),
  FOREIGN KEY (catering_order_id) REFERENCES catering_orders (catering_order_id),
  FOREIGN KEY (order_line_id) REFERENCES order_lines (id)
);
