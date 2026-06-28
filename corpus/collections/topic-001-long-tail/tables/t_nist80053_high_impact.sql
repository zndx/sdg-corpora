CREATE TABLE t_nist80053_high_impact (
  id VARCHAR(255),
  nist VARCHAR(255),
  at_n_i_s_t_impact_level VARCHAR(255) NOT NULL,
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (at_n_i_s_t_impact_level) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"nist80053_high_impact"}'
