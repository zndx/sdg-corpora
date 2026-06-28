CREATE TABLE t_schemaorg_product_price (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  price VARCHAR(255) NOT NULL,
  uri VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (price) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_product_price"}'
