CREATE TABLE t_dempster_combinant_second (
  id VARCHAR(255),
  dempster VARCHAR(255),
  second_combinant VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (second_combinant) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"dempster_combinant_second"}'
