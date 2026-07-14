CREATE TABLE sale_prospective_customersSalesActivityRecord (
  prospective_customer_id INTEGER NOT NULL,
  sales_activity_record_id INTEGER NOT NULL,
  PRIMARY KEY (prospective_customer_id, sales_activity_record_id),
  FOREIGN KEY (prospective_customer_id) REFERENCES sale_prospective_customers (id),
  FOREIGN KEY (sales_activity_record_id) REFERENCES sale_sales_activity_records (id)
);
