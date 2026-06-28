CREATE TABLE t_universal_combined_with_existential (
  id VARCHAR(255),
  universal VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"universal_combined_with_existential"}'
