CREATE TABLE t_column_pair_subject (
  id VARCHAR(255),
  column VARCHAR(255),
  subject_column VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (subject_column) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_pair_subject"}'
