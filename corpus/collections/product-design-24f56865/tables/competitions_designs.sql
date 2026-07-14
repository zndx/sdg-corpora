CREATE TABLE competitions_designs (
  design_competition_id INTEGER NOT NULL,
  product_design_id INTEGER NOT NULL,
  PRIMARY KEY (design_competition_id, product_design_id),
  FOREIGN KEY (design_competition_id) REFERENCES design_competitions (id),
  FOREIGN KEY (product_design_id) REFERENCES product_designs (id)
);
