CREATE TABLE t_breaking_change_subclass (
  id VARCHAR(255),
  breaking VARCHAR(255),
  breaking_change_for VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (breaking_change_for) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"breaking_change_subclass"}'
