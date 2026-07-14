CREATE TABLE firms_designers (
  design_firm_id INTEGER NOT NULL,
  designer_id INTEGER NOT NULL,
  PRIMARY KEY (design_firm_id, designer_id),
  FOREIGN KEY (design_firm_id) REFERENCES design_firms (id),
  FOREIGN KEY (designer_id) REFERENCES designers (id)
);
