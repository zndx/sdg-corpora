CREATE TABLE representatives_products (
  authorised_representative_id INTEGER NOT NULL,
  financial_product_id INTEGER NOT NULL,
  PRIMARY KEY (authorised_representative_id, financial_product_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id),
  FOREIGN KEY (financial_product_id) REFERENCES financial_products (id)
);
