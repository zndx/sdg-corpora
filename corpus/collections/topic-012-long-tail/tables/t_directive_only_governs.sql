CREATE TABLE t_directive_only_governs (
  id VARCHAR(255),
  directive VARCHAR(255),
  related VARCHAR(255),
  effective_date DATE,
  enforcement VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"directive_only_governs"}'
