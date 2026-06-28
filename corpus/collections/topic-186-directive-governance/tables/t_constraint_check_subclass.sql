CREATE TABLE t_constraint_check_subclass (
  id VARCHAR(255),
  constraint VARCHAR(255),
  checks VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  priority INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (checks) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"constraint_check_subclass"}'
