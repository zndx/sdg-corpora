CREATE TABLE t_policy_min_one_enforcer (
  id VARCHAR(255),
  policy VARCHAR(255),
  enforced_by VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (enforced_by) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_min_one_enforcer"}'
