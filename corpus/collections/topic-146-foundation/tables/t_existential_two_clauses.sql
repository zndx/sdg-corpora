CREATE TABLE t_existential_two_clauses (
  id VARCHAR(255),
  existential VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  related_2 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"existential_two_clauses"}'
