CREATE TABLE t_belief_interval_equiv_bel_and_pl (
  id VARCHAR(255),
  belief VARCHAR(255),
  belief_lower_bound VARCHAR(255) NOT NULL,
  plausibility_upper_bound VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (belief_lower_bound) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":false,"template_id":"belief_interval_equiv_bel_and_pl"}'
