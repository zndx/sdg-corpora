CREATE TABLE t_foreign_key_relation (
  id VARCHAR(255),
  foreign VARCHAR(255),
  foreign_key_to VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (foreign_key_to) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"foreign_key_relation"}'
