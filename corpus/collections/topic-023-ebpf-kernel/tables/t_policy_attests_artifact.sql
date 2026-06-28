CREATE TABLE t_policy_attests_artifact (
  id VARCHAR(255),
  policy VARCHAR(255),
  effective_date DATE,
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"policy_attests_artifact"}'
