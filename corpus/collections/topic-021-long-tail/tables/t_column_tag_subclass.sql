CREATE TABLE t_column_tag_subclass (
  id VARCHAR(255),
  column VARCHAR(255),
  annotates_column VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (annotates_column) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_tag_subclass"}'
