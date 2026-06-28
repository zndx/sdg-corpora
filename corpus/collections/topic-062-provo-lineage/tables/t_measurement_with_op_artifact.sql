CREATE TABLE t_measurement_with_op_artifact (
  id VARCHAR(255),
  measurement VARCHAR(255),
  about VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (about) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_with_op_artifact"}'
