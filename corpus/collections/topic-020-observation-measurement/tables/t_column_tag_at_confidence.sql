CREATE TABLE t_column_tag_at_confidence (
  id VARCHAR(255),
  column VARCHAR(255),
  tag_confidence VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (tag_confidence) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_tag_at_confidence"}'
