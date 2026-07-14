CREATE TABLE software_tools (
  id INTEGER NOT NULL,
  software_id VARCHAR(32),
  software_name VARCHAR(32),
  software_version VARCHAR(32),
  developer_name VARCHAR(32),
  interface_type VARCHAR(32),
  learning_curve VARCHAR(32),
  product_design_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (product_design_id) REFERENCES product_designs (id)
);
