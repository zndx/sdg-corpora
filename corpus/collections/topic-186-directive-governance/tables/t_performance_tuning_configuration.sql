CREATE TABLE t_performance_tuning_configuration (
  id VARCHAR(255),
  performance_tuning_configuration VARCHAR(255),
  confidence DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"performance_tuning_configuration"}'
