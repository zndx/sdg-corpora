CREATE TABLE t_policy_basic (
  id VARCHAR(255),
  policy VARCHAR(255),
  effective_date DATE,
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"policy_basic"}'
