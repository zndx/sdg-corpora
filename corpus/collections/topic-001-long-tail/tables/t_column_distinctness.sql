CREATE TABLE t_column_distinctness (
  id VARCHAR(255),
  column VARCHAR(255),
  distinctness_ratio VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (distinctness_ratio) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_distinctness"}'
