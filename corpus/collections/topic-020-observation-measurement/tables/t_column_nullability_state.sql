CREATE TABLE t_column_nullability_state (
  id VARCHAR(255),
  column VARCHAR(255),
  nullability_state VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (nullability_state) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_nullability_state"}'
