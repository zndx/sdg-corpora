CREATE TABLE themes_orders (
  calendar_theme_id INTEGER NOT NULL,
  calendar_order_id INTEGER NOT NULL,
  PRIMARY KEY (calendar_theme_id, calendar_order_id),
  FOREIGN KEY (calendar_theme_id) REFERENCES calendar_themes (id),
  FOREIGN KEY (calendar_order_id) REFERENCES calendar_orders (calendar_order_id)
);
