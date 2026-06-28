CREATE TABLE t_policy_effective_period (
  id VARCHAR(255),
  policy VARCHAR(255),
  effective_during VARCHAR(255),
  scope VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (effective_during) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"policy_effective_period"}'
