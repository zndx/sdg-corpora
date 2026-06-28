CREATE TABLE t_measurement_subclass_only_one_unit (
  id VARCHAR(255),
  measurement VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (unit) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_subclass_only_one_unit"}'
