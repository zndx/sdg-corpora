CREATE TABLE customers (
  id INTEGER NOT NULL,
  customer_id VARCHAR(32),
  full_name VARCHAR(36),
  contact_phone VARCHAR(32),
  email_address VARCHAR(32),
  total_visits INTEGER,
  satisfaction_rating DECIMAL,
  vehicle_id INTEGER,
  invoice_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (invoice_id)
);
