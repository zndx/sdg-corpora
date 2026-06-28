CREATE TABLE t_existential_generic (
  id VARCHAR(255),
  existential VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"existential_generic"}'
