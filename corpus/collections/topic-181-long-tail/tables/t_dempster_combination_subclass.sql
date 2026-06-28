CREATE TABLE t_dempster_combination_subclass (
  id VARCHAR(255),
  dempster VARCHAR(255),
  combines_via_dempster VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (combines_via_dempster) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"dempster_combination_subclass"}'
