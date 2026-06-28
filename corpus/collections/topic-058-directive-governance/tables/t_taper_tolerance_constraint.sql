CREATE TABLE t_taper_tolerance_constraint (
  id VARCHAR(255),
  taper_tolerance_constraint VARCHAR(255),
  recorded_at TIMESTAMP,
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"taper_tolerance_constraint"}'
