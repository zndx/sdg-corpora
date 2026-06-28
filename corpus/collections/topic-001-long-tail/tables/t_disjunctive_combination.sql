CREATE TABLE t_disjunctive_combination (
  id VARCHAR(255),
  disjunctive VARCHAR(255),
  disjunctively_combines VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (disjunctively_combines) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"disjunctive_combination"}'
