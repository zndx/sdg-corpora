CREATE TABLE t_column_pair_object (
  id VARCHAR(255),
  column VARCHAR(255),
  object_column VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (object_column) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_pair_object"}'
