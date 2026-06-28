CREATE TABLE t_existential_with_part_of (
  id VARCHAR(255),
  existential VARCHAR(255),
  part_of VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (part_of) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"existential_with_part_of"}'
