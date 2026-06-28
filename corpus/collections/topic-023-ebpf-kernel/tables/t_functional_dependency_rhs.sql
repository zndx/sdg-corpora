CREATE TABLE t_functional_dependency_rhs (
  id VARCHAR(255),
  functional VARCHAR(255),
  f_d_right_hand_side VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (f_d_right_hand_side) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"functional_dependency_rhs"}'
