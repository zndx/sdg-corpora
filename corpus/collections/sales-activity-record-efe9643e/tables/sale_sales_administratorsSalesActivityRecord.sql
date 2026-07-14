CREATE TABLE sale_sales_administratorsSalesActivityRecord (
  sales_administrator_id INTEGER NOT NULL,
  sales_activity_record_id INTEGER NOT NULL,
  PRIMARY KEY (sales_administrator_id, sales_activity_record_id),
  FOREIGN KEY (sales_administrator_id) REFERENCES sale_sales_administrators (id),
  FOREIGN KEY (sales_activity_record_id) REFERENCES sale_sales_activity_records (id)
);
