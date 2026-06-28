CREATE TABLE t_belief_interval_subclass (
  id VARCHAR(255),
  belief VARCHAR(255),
  belief_lower_bound VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (belief_lower_bound) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"belief_interval_subclass"}'
