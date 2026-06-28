CREATE TABLE t_forward_compatible_with (
  id VARCHAR(255),
  forward VARCHAR(255),
  forward_compatible_with VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (forward_compatible_with) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"forward_compatible_with"}'
