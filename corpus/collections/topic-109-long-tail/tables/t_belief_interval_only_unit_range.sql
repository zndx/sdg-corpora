CREATE TABLE t_belief_interval_only_unit_range (
  id VARCHAR(255),
  belief VARCHAR(255),
  belief_lower_bound VARCHAR(255),
  recorded_at TIMESTAMP,
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (belief_lower_bound) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"belief_interval_only_unit_range"}'
