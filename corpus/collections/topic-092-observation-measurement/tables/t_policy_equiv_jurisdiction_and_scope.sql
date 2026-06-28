CREATE TABLE t_policy_equiv_jurisdiction_and_scope (
  id VARCHAR(255),
  policy VARCHAR(255),
  jurisdiction VARCHAR(255) NOT NULL,
  governs_scope VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"policy_equiv_jurisdiction_and_scope"}'
