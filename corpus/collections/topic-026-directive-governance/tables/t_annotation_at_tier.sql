CREATE TABLE t_annotation_at_tier (
  id VARCHAR(255),
  annotation VARCHAR(255),
  at_tier VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (at_tier) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"annotation_at_tier"}'
