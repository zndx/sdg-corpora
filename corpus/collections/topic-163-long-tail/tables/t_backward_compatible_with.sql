CREATE TABLE t_backward_compatible_with (
  id VARCHAR(255),
  backward VARCHAR(255),
  backward_compatible_with VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (backward_compatible_with) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"backward_compatible_with"}'
