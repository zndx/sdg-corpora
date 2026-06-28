CREATE TABLE t_shell_dimension_specification (
  id VARCHAR(255),
  shell_dimension_specification VARCHAR(255),
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"shell_dimension_specification"}'
