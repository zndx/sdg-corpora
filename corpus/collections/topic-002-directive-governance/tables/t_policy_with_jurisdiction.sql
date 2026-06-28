CREATE TABLE t_policy_with_jurisdiction (
  id VARCHAR(255),
  policy VARCHAR(255),
  jurisdiction VARCHAR(255) NOT NULL,
  review_cycle_days INTEGER,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_with_jurisdiction"}'
