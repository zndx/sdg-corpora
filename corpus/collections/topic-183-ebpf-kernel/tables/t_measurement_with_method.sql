CREATE TABLE t_measurement_with_method (
  id VARCHAR(255),
  measurement VARCHAR(255),
  via_method VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (via_method) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_with_method"}'
