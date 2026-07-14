CREATE TABLE ad_copies (
  ad_copy_id INTEGER NOT NULL,
  copy_area_dimensions VARCHAR(32),
  print_color VARCHAR(32),
  language VARCHAR(32),
  imprint_source VARCHAR(32),
  calendar_order_id INTEGER,
  business_client_id INTEGER,
  corporate_logo_id INTEGER,
  PRIMARY KEY (ad_copy_id),
  FOREIGN KEY (calendar_order_id) REFERENCES calendar_orders (calendar_order_id),
  FOREIGN KEY (business_client_id) REFERENCES business_clients (id),
  FOREIGN KEY (corporate_logo_id) REFERENCES corporate_logos (id)
);
