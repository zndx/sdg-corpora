CREATE TABLE t_conjunctive_combination (
  id VARCHAR(255),
  conjunctive VARCHAR(255),
  conjunctively_combines VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  method VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (conjunctively_combines) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"conjunctive_combination"}'
