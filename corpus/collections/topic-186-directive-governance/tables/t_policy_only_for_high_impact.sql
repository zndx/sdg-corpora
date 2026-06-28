CREATE TABLE t_policy_only_for_high_impact (
  id VARCHAR(255),
  policy VARCHAR(255),
  at_n_i_s_t_impact_level VARCHAR(255),
  review_cycle_days INTEGER,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (at_n_i_s_t_impact_level) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"policy_only_for_high_impact"}'
