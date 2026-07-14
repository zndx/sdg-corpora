CREATE TABLE calendar_orders (
  calendar_order_id INTEGER NOT NULL,
  order_reference VARCHAR(32),
  order_date TIMESTAMP,
  unit_price VARCHAR(32),
  setup_fee DECIMAL,
  total_quantity INTEGER,
  status VARCHAR(32),
  submission_deadline DATE,
  business_client_id INTEGER,
  calendar_theme_id INTEGER,
  ad_copy_id INTEGER,
  corporate_logo_id INTEGER,
  PRIMARY KEY (calendar_order_id),
  FOREIGN KEY (business_client_id) REFERENCES business_clients (id),
  FOREIGN KEY (calendar_theme_id) REFERENCES calendar_themes (id),
  FOREIGN KEY (ad_copy_id) REFERENCES ad_copies (ad_copy_id),
  FOREIGN KEY (corporate_logo_id) REFERENCES corporate_logos (id)
);
