CREATE TABLE t_cardinality_min_two_generic (
  id VARCHAR(255),
  cardinality VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"cardinality_min_two_generic"}'
