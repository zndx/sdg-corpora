CREATE TABLE t_rollback_relation (
  id VARCHAR(255),
  rollback VARCHAR(255),
  rolls_back_to VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (rolls_back_to) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"rollback_relation"}'
