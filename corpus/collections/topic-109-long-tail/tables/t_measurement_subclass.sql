CREATE TABLE t_measurement_subclass (
  id VARCHAR(255),
  measurement VARCHAR(255),
  dimension VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (dimension) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_subclass"}'
