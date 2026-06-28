CREATE TABLE t_column_tag_from_annotator (
  id VARCHAR(255),
  column VARCHAR(255),
  by_annotator VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (by_annotator) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_tag_from_annotator"}'
