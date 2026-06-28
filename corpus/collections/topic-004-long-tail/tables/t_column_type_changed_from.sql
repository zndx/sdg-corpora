CREATE TABLE t_column_type_changed_from (
  id VARCHAR(255),
  column VARCHAR(255),
  type_changed_from VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (type_changed_from) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_type_changed_from"}'
