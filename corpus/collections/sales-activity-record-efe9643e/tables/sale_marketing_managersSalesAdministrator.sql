CREATE TABLE sale_marketing_managersSalesAdministrator (
  marketing_manager_id INTEGER NOT NULL,
  sales_administrator_id INTEGER NOT NULL,
  PRIMARY KEY (marketing_manager_id, sales_administrator_id),
  FOREIGN KEY (marketing_manager_id) REFERENCES sale_marketing_managers (id),
  FOREIGN KEY (sales_administrator_id) REFERENCES sale_sales_administrators (id)
);
