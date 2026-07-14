CREATE TABLE products_representatives (
  financial_product_id INTEGER NOT NULL,
  authorised_representative_id INTEGER NOT NULL,
  PRIMARY KEY (financial_product_id, authorised_representative_id),
  FOREIGN KEY (financial_product_id) REFERENCES financial_products (id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id)
);
