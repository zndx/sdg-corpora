CREATE TABLE t_measurement_with_precision (
  id VARCHAR(255),
  measurement VARCHAR(255),
  precision VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (precision) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_with_precision"}'
