CREATE TABLE t_policy_only_governs_artifacts (
  id VARCHAR(255),
  policy VARCHAR(255),
  enforcement VARCHAR(255),
  priority INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"policy_only_governs_artifacts"}'
