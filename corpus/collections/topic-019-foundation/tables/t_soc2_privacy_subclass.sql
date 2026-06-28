CREATE TABLE t_soc2_privacy_subclass (
  id VARCHAR(255),
  soc VARCHAR(255),
  for_s_o_c2_domain VARCHAR(255) NOT NULL,
  effective_date DATE,
  enforcement VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (for_s_o_c2_domain) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"soc2_privacy_subclass"}'
