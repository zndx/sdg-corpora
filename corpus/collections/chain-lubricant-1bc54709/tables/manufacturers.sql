CREATE TABLE manufacturers (
  id INTEGER NOT NULL,
  manufacturer_id VARCHAR(34),
  name VARCHAR(32),
  support_phone VARCHAR(32),
  lubricant_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (lubricant_id) REFERENCES chain_lubricants (lubricant_id)
);
