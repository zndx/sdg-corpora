CREATE TABLE t_policy_subclass_governs (
  id VARCHAR(255),
  policy VARCHAR(255),
  governs_scope VARCHAR(255) NOT NULL,
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (governs_scope) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_subclass_governs"}'
