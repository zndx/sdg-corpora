CREATE TABLE t_policy_with_review_cycle (
  id VARCHAR(255),
  policy VARCHAR(255),
  review_cycle VARCHAR(255) NOT NULL,
  scope VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (review_cycle) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_with_review_cycle"}'
