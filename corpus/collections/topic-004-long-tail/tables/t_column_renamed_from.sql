CREATE TABLE t_column_renamed_from (
  id VARCHAR(255),
  column VARCHAR(255),
  renamed_from VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (renamed_from) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_renamed_from"}'
