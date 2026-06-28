CREATE TABLE t_column_version_subclass (
  id VARCHAR(255),
  column VARCHAR(255),
  column_version VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (column_version) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_version_subclass"}'
