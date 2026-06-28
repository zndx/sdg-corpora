CREATE TABLE t_constraint_min_one_check (
  id VARCHAR(255),
  constraint VARCHAR(255),
  checks VARCHAR(255) NOT NULL,
  effective_date DATE,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (checks) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"constraint_min_one_check"}'
