CREATE TABLE t_column_property_subclass (
  id VARCHAR(255),
  column VARCHAR(255),
  annotates_property_of VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (annotates_property_of) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_property_subclass"}'
