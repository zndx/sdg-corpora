CREATE TABLE t_home_electricity_reduction_program (
  id VARCHAR(255),
  reduction_program VARCHAR(255),
  targets_participant VARCHAR(255) NOT NULL,
  addresses_usage_metric VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"home_electricity_reduction_program"}'
