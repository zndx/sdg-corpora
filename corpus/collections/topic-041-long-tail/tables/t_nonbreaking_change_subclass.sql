CREATE TABLE t_nonbreaking_change_subclass (
  id VARCHAR(255),
  nonbreaking VARCHAR(255),
  non_breaking_change_for VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  method VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (non_breaking_change_for) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"nonbreaking_change_subclass"}'
