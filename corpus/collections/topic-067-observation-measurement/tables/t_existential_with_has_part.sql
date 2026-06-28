CREATE TABLE t_existential_with_has_part (
  id VARCHAR(255),
  existential VARCHAR(255),
  has_part VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (has_part) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"existential_with_has_part"}'
