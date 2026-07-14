CREATE TABLE happy_hour_specials (
  id INTEGER NOT NULL,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  discount_percentage DECIMAL,
  is_active BOOLEAN,
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);
