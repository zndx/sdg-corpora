CREATE TABLE t_indoor_environmental_monitoring_process (
  id VARCHAR(255),
  indoor_environmental_monitoring_process VARCHAR(255),
  monitors_indoor_environment VARCHAR(255) NOT NULL,
  uses_monitoring_protocol VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"indoor_environmental_monitoring_process"}'
