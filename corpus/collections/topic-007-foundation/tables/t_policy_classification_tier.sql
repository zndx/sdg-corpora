CREATE TABLE t_policy_classification_tier (
  id VARCHAR(255),
  policy VARCHAR(255),
  at_classification_tier VARCHAR(255) NOT NULL,
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (at_classification_tier) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_classification_tier"}'
