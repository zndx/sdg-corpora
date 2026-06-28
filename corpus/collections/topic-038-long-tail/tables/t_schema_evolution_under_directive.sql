CREATE TABLE t_schema_evolution_under_directive (
  id VARCHAR(255),
  schema VARCHAR(255),
  uncertainty DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"schema_evolution_under_directive"}'
