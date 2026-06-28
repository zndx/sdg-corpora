CREATE TABLE t_material_density_specification (
  id VARCHAR(255),
  material_density_specification VARCHAR(255),
  confidence DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"material_density_specification"}'
