CREATE TABLE orders_zones (
  evacuation_order_id INTEGER NOT NULL,
  evacuation_zone_id INTEGER NOT NULL,
  PRIMARY KEY (evacuation_order_id, evacuation_zone_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evacuation_orders (id),
  FOREIGN KEY (evacuation_zone_id) REFERENCES evacuation_zones (id)
);
