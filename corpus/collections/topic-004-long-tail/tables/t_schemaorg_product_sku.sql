CREATE TABLE t_schemaorg_product_sku (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  s_k_u VARCHAR(255) NOT NULL,
  version INTEGER,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (s_k_u) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_product_sku"}'
