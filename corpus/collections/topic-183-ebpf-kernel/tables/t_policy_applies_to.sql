CREATE TABLE t_policy_applies_to (
  id VARCHAR(255),
  policy VARCHAR(255),
  applies_to VARCHAR(255) NOT NULL,
  effective_date DATE,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (applies_to) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"policy_applies_to"}'
