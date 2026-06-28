CREATE TABLE t_belief_interval_with_upper_bound (
  id VARCHAR(255),
  belief VARCHAR(255),
  plausibility_upper_bound VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (plausibility_upper_bound) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"belief_interval_with_upper_bound"}'
