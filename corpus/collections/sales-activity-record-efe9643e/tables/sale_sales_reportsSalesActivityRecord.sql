CREATE TABLE sale_sales_reportsSalesActivityRecord (
  sales_report_id INTEGER NOT NULL,
  sales_activity_record_id INTEGER NOT NULL,
  PRIMARY KEY (sales_report_id, sales_activity_record_id),
  FOREIGN KEY (sales_report_id) REFERENCES sale_sales_reports (id),
  FOREIGN KEY (sales_activity_record_id) REFERENCES sale_sales_activity_records (id)
);
