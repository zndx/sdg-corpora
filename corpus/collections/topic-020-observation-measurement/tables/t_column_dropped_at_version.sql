CREATE TABLE t_column_dropped_at_version (
  id VARCHAR(255),
  column VARCHAR(255),
  dropped_at_schema_version VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (dropped_at_schema_version) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_dropped_at_version"}'
