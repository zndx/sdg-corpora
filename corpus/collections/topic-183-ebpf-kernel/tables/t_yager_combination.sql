CREATE TABLE t_yager_combination (
  id VARCHAR(255),
  yager VARCHAR(255),
  yager_combines VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (yager_combines) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"yager_combination"}'
