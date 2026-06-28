CREATE TABLE t_column_added_at_version (
  id VARCHAR(255),
  column VARCHAR(255),
  added_at_schema_version VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (added_at_schema_version) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_added_at_version"}'
