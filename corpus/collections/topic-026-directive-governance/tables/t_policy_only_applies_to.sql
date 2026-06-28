CREATE TABLE t_policy_only_applies_to (
  id VARCHAR(255),
  policy VARCHAR(255),
  applies_to VARCHAR(255),
  effective_date DATE,
  priority INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applies_to) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"policy_only_applies_to"}'
