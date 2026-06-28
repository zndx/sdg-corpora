CREATE TABLE t_measurement_observed_at (
  id VARCHAR(255),
  measurement VARCHAR(255),
  observed_at VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (observed_at) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_observed_at"}'
