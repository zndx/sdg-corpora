CREATE TABLE t_belief_interval_at_confidence_level (
  id VARCHAR(255),
  belief VARCHAR(255),
  at_confidence_level VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (at_confidence_level) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"belief_interval_at_confidence_level"}'
