CREATE TABLE t_column_value_distribution (
  id VARCHAR(255),
  column VARCHAR(255),
  value_distribution VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (value_distribution) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_value_distribution"}'
