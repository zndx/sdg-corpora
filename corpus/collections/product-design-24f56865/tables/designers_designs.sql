CREATE TABLE designers_designs (
  designer_id INTEGER NOT NULL,
  product_design_id INTEGER NOT NULL,
  PRIMARY KEY (designer_id, product_design_id),
  FOREIGN KEY (designer_id) REFERENCES designers (id),
  FOREIGN KEY (product_design_id) REFERENCES product_designs (id)
);
